package artefact

import (
	"github.com/pkg/errors"
	"github.com/sirupsen/logrus"
	"go.uber.org/dig"
	"golang.org/x/text/encoding/charmap"
	"golang.org/x/text/transform"
	"os"
	"path"
	"regexp"
	"sdf-converter/internal/config"
	"sdf-converter/internal/epgu/kf/form"
	"sdf-converter/internal/registry"
	"sdf-converter/internal/util"
	"strings"
)

// ItemKind ...
type ItemKind int

const (
	// ItemNone ...
	ItemNone ItemKind = iota
	// ItemTemplate ...
	ItemTemplate
	// ItemCopy ...
	ItemCopy
)

// Item ...
type Item struct {
	Path string
	Kind ItemKind
}

// Content ...
type Content struct {
	items        []Item
	builder      *form.Builder
	templatePath string
	template     *Template
}

// ContentDI ...
type ContentDI struct {
	dig.In
	Builder  *form.Builder
	Config   *config.Config
	Template *Template
}

// NewContent ...
func NewContent(di ContentDI) (*Content, error) {

	items := []Item{
		{"coresvc/001-pguforms-xslt-100000102327.ws.sql", ItemTemplate},
		{"coresvc/002-pguforms-validator-59162.59162.sql", ItemCopy},
		{"coresvc/003-pguforms-validator-E_mail.sql", ItemCopy},
		{"coresvc/004-pguforms-validator-mobile_19565.sql", ItemCopy},
		{"coresvc/005-pguforms-validator-rnd.sql", ItemCopy},
		{"coresvc/006-pguforms-validator-rnd_name.sql", ItemCopy},
		{"coresvc/007-pguforms-validator-rnd_otch.sql", ItemCopy},
		{"coresvc/008-nsi-create-EQUEUE_100000102511_getSlots.sql", ItemCopy},
		{"coresvc/009-nsi-create-EQUEUE_100000102511_book.sql", ItemCopy},
		{"coresvc/010-nsi-create-EQUEUE_100000102511_cancelBooking.sql", ItemCopy},
		{"coresvc/011-nsi-create-EQUEUE_100000102511_getBookingStatus.sql", ItemCopy},
		{"coresvc/012-pgu-inviationStatuses-100000102511.sql", ItemCopy},
		{"coresvc/013-pgu-smev3_status_100000102327.sql", ItemTemplate},

		{"coresvc/rollback/001-pguforms-xslt-100000102327.ws.sql", ItemTemplate},
		{"coresvc/rollback/002-pguforms-validator-59162.59162.sql", ItemCopy},
		{"coresvc/rollback/003-pguforms-validator-E_mail.sql", ItemCopy},
		{"coresvc/rollback/004-pguforms-validator-mobile_19565.sql", ItemCopy},
		{"coresvc/rollback/005-pguforms-validator-rnd.sql", ItemCopy},
		{"coresvc/rollback/006-pguforms-validator-rnd_name.sql", ItemCopy},
		{"coresvc/rollback/007-pguforms-validator-rnd_otch.sql", ItemCopy},
		{"coresvc/rollback/008-nsi-create-EQUEUE_100000102511_getSlots.sql", ItemCopy},
		{"coresvc/rollback/009-nsi-create-EQUEUE_100000102511_book.sql", ItemCopy},
		{"coresvc/rollback/010-nsi-create-EQUEUE_100000102511_cancelBooking.sql", ItemCopy},
		{"coresvc/rollback/011-nsi-create-EQUEUE_100000102511_getBookingStatus.sql", ItemCopy},
		{"coresvc/rollback/012-pgu-inviationStatuses-100000102511.sql", ItemCopy},
		{"coresvc/rollback/013-pgu-smev3_status_100000102327.sql", ItemTemplate},

		{"forms/svcform/100000102327-pguforms-orderform.sql", ItemTemplate},
		{"forms/svcform/100000102511-pguforms-orderform.sql", ItemCopy},

		{"forms/svcform/rollback/100000102327-pguforms-orderform.sql", ItemCopy},
		{"forms/svcform/rollback/100000102511-pguforms-orderform.sql", ItemCopy},

		{"forms/svcspec/001-pguapi-pub-100000102327.sql", ItemTemplate},
		{"forms/svcspec/003-pgu-eserviceattr-100000102327.sql", ItemTemplate},
		{"forms/svcspec/004-pguapi-pub-100000102511.sql", ItemCopy},
		{"forms/svcspec/005-pgu-setVisible-100000102511.sql", ItemCopy},
		{"forms/svcspec/006-pgu-eserviceattr-100000102511.sql", ItemCopy},
		{"forms/svcspec/007-pgu-commonToEservice-100000102327.sql", ItemTemplate},

		{"forms/svcspec/rollback/001-pguapi-pub-100000102327.sql", ItemTemplate},
		{"forms/svcspec/rollback/003-pgu-eserviceattr-100000102327.sql", ItemTemplate},
		{"forms/svcspec/rollback/004-pguapi-pub-100000102511.sql", ItemCopy},
		{"forms/svcspec/rollback/005-pgu-setVisible-100000102511.sql", ItemCopy},
		{"forms/svcspec/rollback/006-pgu-eserviceattr-100000102511.sql", ItemCopy},
		{"forms/svcspec/rollback/007-pgu-commonToEservice-100000102327.sql", ItemTemplate},
	}

	templatePath := di.Config.Dir.Template

	for _, item := range items {
		if item.Kind != ItemTemplate {
			continue
		}
		if err := di.Template.AddFile(item.Path); err != nil {
			return nil, errors.Wrapf(err, "unable add template file %s", item.Path)
		}
	}

	return &Content{
		builder:  di.Builder,
		template: di.Template,

		items:        items,
		templatePath: templatePath,
	}, nil
}

// Prepare ...
func (c *Content) Prepare(reg *registry.Registry, folders map[string]string) error {

	//reg.SDF.FullName = reg.ServiceName
	//reg.SDF.ShortName = reg.ServiceTargetName

	// Генерируем json формы
	formJSON := c.builder.Build(reg.ServiceFormCode, reg.SDF)
	formJSON = regexp.MustCompile(`\n$`).ReplaceAllString(formJSON, "")

	applicant := make([]string, len(reg.ApplicantType))
	for i, item := range reg.ApplicantType {
		switch item {
		case registry.ApplicantIE:
			applicant[i] = "SOLE_PROPRIETOR"
		case registry.ApplicantNP:
			applicant[i] = "PERSON"
		case registry.ApplicantLE:
			applicant[i] = "LEGAL"
		}
	}

	var useSignature string
	switch reg.UseSignature {
	case true:
		useSignature = "EDS_MANDATORY"
	case false:
		useSignature = "EDS_NOT_SUPPORTED"
	}

	//formJSON = util.ToCP1251(formJSON)
	lines := util.SplitSubN(formJSON, 200)
	for i, line := range lines {
		lines[i] = "q'^" + strings.ReplaceAll(line, "?", "^' ||\n"+" '?'\n"+" || q'^")
		if i < len(lines)-1 {
			lines[i] += "^' ||"
		} else {
			lines[i] += "^'"
		}
	}

	formJSON = strings.Join(lines, "\n")

	meta := Meta{
		FormJSON:          formJSON,
		DepartmentName:    reg.DepartmentName,
		DepartmentCode:    reg.DepartmentCode,
		ServiceName:       reg.ServiceName,
		ServiceTargetName: reg.ServiceTargetName,
		ServiceTargetID:   reg.ServiceTargetID,
		ServiceFormCode:   reg.ServiceFormCode,
		ApplicantType:     strings.Join(applicant, ","),
		Signature:         useSignature,
	}

	for _, item := range c.items {

		switch item.Kind {
		case ItemCopy:

			paths := strings.Split(item.Path, "/")
			name := paths[len(paths)-1]
			dir := strings.Join(paths[:len(paths)-1], "/")

			src := path.Join(c.templatePath, item.Path)
			dst := path.Join(folders[dir], name)

			if err := util.CopyFile(src, dst); err != nil {
				return errors.Wrapf(err, "unable to copy file from %s to %s", src, dst)
			}

		case ItemTemplate:

			paths := strings.Split(item.Path, "/")
			name := paths[len(paths)-1]
			dir := strings.Join(paths[:len(paths)-1], "/")

			fileName := strings.ReplaceAll(name, "100000102327", reg.ServiceFormCode)
			filePath := path.Join(folders[dir], fileName)

			file, err := os.Create(filePath)
			if err != nil {
				return errors.Wrapf(err, "unable to create file %s", filePath)
			}

			writer := transform.NewWriter(file, charmap.Windows1251.NewEncoder())

			if err := c.template.Execute(writer, item.Path, meta); err != nil {
				_ = file.Close()
				return errors.Wrapf(err, "unable to call template.ExecuteTemplate(%s)", name)
			}

			if err := file.Close(); err != nil {
				logrus.WithError(err).Errorf("unable close file %s", filePath)
			}
		}
	}

	return nil
}

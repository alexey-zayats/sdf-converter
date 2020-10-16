package converter

import (
	"context"
	"fmt"
	"github.com/pkg/errors"
	"go.uber.org/dig"
	"path"
	"sdf-converter/internal/artefact"
	"sdf-converter/internal/config"
	"sdf-converter/internal/registry"
)

// Converter ...
type Converter struct {
	config  *config.Config
	content *artefact.Content
}

// DI ...
type DI struct {
	dig.In
	Config  *config.Config
	Content *artefact.Content
}

// NewConverter ...
func NewConverter(di DI) *Converter {
	return &Converter{
		config:  di.Config,
		content: di.Content,
	}
}

// Convert ...
func (c *Converter) Convert(ctx context.Context, reg *registry.Registry) error {

	recordPath := path.Join(c.config.Dir.Tmp, reg.ServiceTargetID)
	folders := artefact.NewFolders(recordPath, fmt.Sprintf("forms.61.%s", reg.DepartmentCode))

	//// Создаем структуру папок архива
	if err := folders.MakeStruct(); err != nil {
		return errors.Wrap(err, "unable make dir struct")
	}

	// Генерируем скрипты по шаблонам
	if err := c.content.Prepare(reg, folders.Struct()); err != nil {
		return errors.Wrapf(err, "unable to prepare content for %s", reg.ServiceTargetID)
	}

	// Архивируем артефакты
	recordArchiver := artefact.NewArchiver(recordPath, c.config.Dir.Artefact, reg.ServiceTargetID+".zip")
	if err := recordArchiver.Compose(); err != nil {
		return errors.Wrapf(err, "unable to composer archive for %s", reg.ServiceTargetID)
	}

	// Очищаем рабочую папку
	if err := folders.Cleanup(); err != nil {
		return errors.Wrap(err, "unable clean dir struct")
	}

	return nil
}

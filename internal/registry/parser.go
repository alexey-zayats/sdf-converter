package registry

import (
	"fmt"
	"github.com/360EntSecGroup-Skylar/excelize"
	"github.com/pkg/errors"
	"github.com/sirupsen/logrus"
)

// Parser ...
type Parser struct{}

// NewParser ...
func NewParser() *Parser {
	return &Parser{}
}

// Parse ...
func (p *Parser) Parse(filePath string, out chan *Registry) error {

	f, err := excelize.OpenFile(filePath)
	if err != nil {
		return errors.Wrapf(err, "unable open xlsx file %s", filePath)
	}

	for _, sheet := range f.GetSheetMap() {
		logrus.Debug(sheet)

		rows, err := f.Rows(sheet)
		if err != nil {
			return errors.Wrapf(err, "unable get rows by sheet %s", sheet)
		}

		i := 1
		for rows.Next() {

			i++

			axis := map[string]string{
				"departmentName":    fmt.Sprintf("A%d", i),
				"departmentCode":    fmt.Sprintf("B%d", i),
				"serviceName":       fmt.Sprintf("C%d", i),
				"serviceTargetName": fmt.Sprintf("D%d", i),
				"serviceTargetID":   fmt.Sprintf("E%d", i),
				"serviceFormCode":   fmt.Sprintf("F%d", i),
				"applicantType":     fmt.Sprintf("G%d", i),
				"useSignature":      fmt.Sprintf("H%d", i),
			}

			departmentName := f.GetCellValue(sheet, axis["departmentName"])
			departmentCode := f.GetCellValue(sheet, axis["departmentCode"])
			serviceName := f.GetCellValue(sheet, axis["serviceName"])
			serviceTargetName := f.GetCellValue(sheet, axis["serviceTargetName"])
			serviceTargetID := f.GetCellValue(sheet, axis["serviceTargetID"])
			serviceFormCode := f.GetCellValue(sheet, axis["serviceFormCode"])
			applicantType := f.GetCellValue(sheet, axis["applicantType"])
			useSignature := f.GetCellValue(sheet, axis["useSignature"])

			if serviceTargetID == "" {
				break
			}

			data := &Registry{
				DepartmentName:    departmentName,
				DepartmentCode:    departmentCode,
				ServiceName:       serviceName,
				ServiceTargetName: serviceTargetName,
				ServiceTargetID:   serviceTargetID,
				ServiceFormCode:   fmt.Sprintf("100000%s", serviceFormCode),
				ApplicantType:     parseApplicant(applicantType),
				UseSignature:      parseUseSignature(useSignature),
			}

			switch sheet {
			case "Региональные":
				data.Kind = KindRegional
			case "Муниципальные":
				data.Kind = KindMunicipal
			}

			out <- data
		}
	}

	return nil
}

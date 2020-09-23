package registry

import "strings"

// ApplicantType ...
type ApplicantType int

const (
	// ApplicantNone ...
	ApplicantNone ApplicantType = iota

	// ApplicantNP физическое лицо (Natural Person)
	ApplicantNP

	// ApplicantIE индивидуальный предпрениматель (Individual Entrepreneur)
	ApplicantIE

	// ApplicantLE юридическое лицо (Legal Entity)
	ApplicantLE
)

func toApplicantType(value string) ApplicantType {
	switch value {
	case "ЮЛ":
		return ApplicantLE
	case "ФЛ":
		return ApplicantNP
	case "ИП":
		return ApplicantIE
	}
	return ApplicantNone
}

func parseApplicant(value string) []ApplicantType {

	list := strings.Split(value, ",")
	result := make([]ApplicantType, len(list))

	for i, v := range list {
		result[i] = toApplicantType(v)
	}

	return result
}

func parseUseSignature(value string) bool {
	switch value {
	case "да":
	case "1":
	case "y":
	case "yes":
	case "+":
		return true
	}
	return false
}

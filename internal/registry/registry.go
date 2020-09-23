package registry

import "sdf-converter/internal/sdf"

// Kind ...
type Kind int

const (
	// KindNone ...
	KindNone Kind = iota

	// KindRegional ...
	KindRegional

	// KindMunicipal ...
	KindMunicipal
)

// Registry ...
type Registry struct {
	Kind              Kind
	DepartmentName    string
	DepartmentCode    string
	ServiceName       string
	ServiceTargetName string
	ServiceTargetID   string
	ServiceFormCode   string
	ApplicantType     []ApplicantType
	UseSignature      bool

	SDF *sdf.Service
}

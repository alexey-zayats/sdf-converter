package field

import (
	"bytes"
	"encoding/json"
	"sdf-converter/internal/epgu/kf"
)

// Field ...
type Field struct {
	ClassName string `json:"className,omitempty"`
	Name      string `json:"name,omitempty"`
	FullPath  string `json:"fullPath,omitempty"`

	Required  bool `json:"required,omitempty"`
	Disabled  bool `json:"disabled,omitempty"`
	Readonly  bool `json:"readonly,omitempty"`
	Immutable bool `json:"immutable,omitempty"`

	Strategy string `json:"strategy,omitempty"`

	Label      string        `json:"label,omitempty"`
	Value      string        `json:"value,omitempty"`
	TextValue  string        `json:"textValue,omitempty"`
	Dictionary kf.Dictionary `json:"dictionary,omitempty"`

	ForceXML  bool `json:"forceXml,omitempty"`
	Maxlength int  `json:"maxlength,omitempty"`
	Minlength int  `json:"minlength,omitempty"`

	TheMaskValue string `json:"theMaskValue,omitempty"`
	SaveWithMask bool   `json:"saveWithMask,omitempty"`

	NotRequiredText string `json:"notRequiredText,omitempty"`

	Limits     string         `json:"limits,omitempty"`
	Validators []kf.Validator `json:"validators,omitempty"`

	SubmitEvents kf.SubmitEvents `json:"submitEvents"`
	Rules        []string        `json:"rules,omitempty"`
	Handlers     []kf.Handler    `json:"handler,omitempty"`

	Hint     string `json:"hint,omitempty"`
	MimeType string `json:"mimeType,omitempty"`
	FileType string `json:"fileType,omitempty"`
	FileSize int    `json:"fileSize,omitempty"`
}

// Option ...
type Option func(field *Field)

// NewField ...
func NewField(path []string, class string, opts ...Option) kf.Item {

	t := &Field{
		ClassName:    class,
		Name:         kf.Name(path),
		FullPath:     kf.Path(path),
		SubmitEvents: kf.SubmitEvents{},
		Rules:        []string{},
	}

	for _, opt := range opts {
		opt(t)
	}

	return t
}

// GetPath ...
func (f *Field) GetPath() []string {
	return []string{}
}

// String ...
func (f *Field) String() string {
	buffer := &bytes.Buffer{}
	encoder := json.NewEncoder(buffer)
	encoder.SetEscapeHTML(false)
	//encoder.SetIndent("", "  ")
	encoder.Encode(f)
	return buffer.String()
}

// GetItems ...
func (f *Field) GetItems() []kf.Item {
	return nil
}

// GetItem ...
func (f *Field) GetItem(idx int) kf.Item {
	return nil
}

// AddItem ...
func (f *Field) AddItem(items ...kf.Item) kf.Item {
	return f
}

// WithTextValue ...
func WithTextValue(value string) Option {
	return func(f *Field) {
		f.TextValue = value
	}
}

// WithValue ...
func WithValue(value string) Option {
	return func(f *Field) {
		f.Value = value
	}
}

// WithStrategy ...
func WithStrategy(strategy string) Option {
	return func(f *Field) {
		f.Strategy = strategy
	}
}

// WithForceXML ...
func WithForceXML(force bool) Option {
	return func(f *Field) {
		f.ForceXML = force
	}
}

// WithMaskValue ...
func WithMaskValue(value string) Option {
	return func(f *Field) {
		f.TheMaskValue = value
	}
}

// WithSaveWithMask ...
func WithSaveWithMask(value bool) Option {
	return func(f *Field) {
		f.SaveWithMask = value
	}
}

// WithReadonly ...
func WithReadonly(value bool) Option {
	return func(f *Field) {
		f.Readonly = value
	}
}

// WithLabel ...
func WithLabel(label string) Option {
	return func(f *Field) {
		f.Label = label
	}
}

// WithLimits ...
func WithLimits(label string) Option {
	return func(f *Field) {
		f.Limits = label
	}
}

// WithNotRequiredText ...
func WithNotRequiredText(value string) Option {
	return func(f *Field) {
		f.NotRequiredText = value
	}
}

// WithImmutable ...
func WithImmutable(value bool) Option {
	return func(f *Field) {
		f.Immutable = value
	}
}

// WithRequired ...
func WithRequired(value bool) Option {
	return func(f *Field) {
		f.Required = value
	}
}

// WithDisabled ...
func WithDisabled(value bool) Option {
	return func(f *Field) {
		f.Disabled = value
	}
}

// WithMaxlength ...
func WithMaxlength(value int) Option {
	return func(f *Field) {
		f.Maxlength = value
	}
}

// WithMinlength ...
func WithMinlength(value int) Option {
	return func(f *Field) {
		f.Minlength = value
	}
}

// WithValidators ...
func WithValidators(value []kf.Validator) Option {
	return func(f *Field) {
		f.Validators = value
	}
}

// WithDictionary ...
func WithDictionary(value kf.Dictionary) Option {
	return func(f *Field) {
		f.Dictionary = value
	}
}

// WithHint ...
func WithHint(value string) Option {
	return func(f *Field) {
		f.Hint = value
	}
}

// WithMimeType ...
func WithMimeType(value string) Option {
	return func(f *Field) {
		f.MimeType = value
	}
}

// WithFileType ...
func WithFileType(value string) Option {
	return func(f *Field) {
		f.FileType = value
	}
}

// WithFileSize ...
func WithFileSize(value int) Option {
	return func(f *Field) {
		f.FileSize = value
	}
}

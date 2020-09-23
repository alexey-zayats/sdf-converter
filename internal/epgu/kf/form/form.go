package form

import (
	"bytes"
	"encoding/json"
	"fmt"
	"sdf-converter/internal/epgu/kf"
	"strings"
)

// Option ...
type Option func(*Form)

// Form ...
type Form struct {
	ClassName       string          `json:"className,omitempty"`
	Name            string          `json:"name,omitempty"`
	FullPath        string          `json:"fullPath,omitempty"`
	Handlers        []kf.Handler    `json:"handler,"`
	NeedLoadDraft   bool            `json:"needLoadDraft,omitempty"`
	Title           string          `json:"title,omitempty"`
	StepsOnTop      bool            `json:"stepsOnTop,"`
	ShowDescription bool            `json:"showDescription,"`
	EngineVersion   string          `json:"engineVersion,omitempty"`
	ShowAllSteps    bool            `json:"showAllSteps,omitempty"`
	SubmitEvents    kf.SubmitEvents `json:"submitEvents,omitempty"`
	Items           []kf.Item       `json:"items,omitempty"`
	Rules           []string        `json:"rules,omitempty"`
}

// NewForm ...
func NewForm(path []string, serviceKey string, opts ...Option) kf.Item {

	f := &Form{
		ClassName:       "Form",
		Name:            kf.Name(path),
		FullPath:        kf.Path(path),
		Handlers:        []kf.Handler{},
		NeedLoadDraft:   true,
		Title:           "",
		StepsOnTop:      false,
		ShowDescription: false,
		EngineVersion:   "EnginePlayerPgu",
		ShowAllSteps:    true,
		SubmitEvents: kf.SubmitEvents{
			"submit": []map[string]interface{}{
				{
					"eventType":                 "submit",
					"serviceKey":                serviceKey,
					"soapAction":                "",
					"requestAppDataTransformer": "",
					"requestTransformer":        fmt.Sprintf("%s.ws", serviceKey),
					"responseTransformer":       "",
					"submitType":                "FINAL",
					"xmlPayloadType":            "PUBLIC_API_XML",
					"_id":                       0,
				},
			},
		},
	}

	for _, opt := range opts {
		opt(f)
	}

	return f
}

// GetPath ...
func (f *Form) GetPath() []string {
	return strings.Split(f.FullPath, ".")
}

// GetItems ...
func (f *Form) GetItems() []kf.Item {
	return f.Items
}

// GetItem ...
func (f *Form) GetItem(idx int) kf.Item {
	if len(f.Items) > idx {
		return f.Items[idx]
	}
	return nil
}

// String ...
func (f *Form) String() string {
	buffer := &bytes.Buffer{}
	encoder := json.NewEncoder(buffer)
	encoder.SetEscapeHTML(false)
	//encoder.SetIndent("", "  ")
	encoder.Encode(f)
	return buffer.String()
}

// AddItem ...
func (f *Form) AddItem(items ...kf.Item) kf.Item {
	for _, item := range items {
		f.Items = append(f.Items, item)
	}
	return f
}

// WithTitle ...
func WithTitle(title string) Option {
	return func(f *Form) {
		f.Title = title
	}
}

// WithRules ...
func WithRules(rules []string) Option {
	return func(f *Form) {
		f.Rules = rules
	}
}

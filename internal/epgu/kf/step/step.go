package step

import (
	"bytes"
	"encoding/json"
	"sdf-converter/internal/epgu/kf"
	"strings"
)

// Option ...
type Option func(*Step)

// Step ...
type Step struct {
	ClassName    string          `json:"className,omitempty"`
	Name         string          `json:"name,omitempty"`
	FullPath     string          `json:"fullPath,omitempty"`
	Visible      bool            `json:"visible,omitempty"`
	Label        string          `json:"label,omitempty"`
	Title        string          `json:"title,"`
	SubmitEvents kf.SubmitEvents `json:"submitEvents"`
	Items        []kf.Item       `json:"items,omitempty"`
	Rules        []string        `json:"rules,omitempty"`
	Handlers     []kf.Handler    `json:"handlers,omitempty"`
	HTML         string          `json:"html,omitempty"`
}

// NewStep ...
func NewStep(path []string, class string, opts ...Option) kf.Item {

	s := &Step{
		ClassName:    class,
		Name:         kf.Name(path),
		FullPath:     kf.Path(path),
		SubmitEvents: kf.SubmitEvents{},
		Rules:        []string{},
	}
	for _, opt := range opts {
		opt(s)
	}
	return s
}

// GetPath ...
func (s *Step) GetPath() []string {
	return strings.Split(s.FullPath, ".")
}

// GetItems ...
func (s *Step) GetItems() []kf.Item {
	return s.Items
}

// GetItem ...
func (s *Step) GetItem(idx int) kf.Item {
	if len(s.Items) > idx {
		return s.Items[idx]
	}
	return nil
}

// String ...
func (s *Step) String() string {
	buffer := &bytes.Buffer{}
	encoder := json.NewEncoder(buffer)
	encoder.SetEscapeHTML(false)
	//encoder.SetIndent("", "  ")
	encoder.Encode(s)
	return buffer.String()
}

// AddItem ...
func (s *Step) AddItem(items ...kf.Item) kf.Item {
	for _, item := range items {
		s.Items = append(s.Items, item)
	}
	return s
}

// WithEvents ...
func WithEvents(events kf.SubmitEvents) Option {
	return func(s *Step) {
		s.SubmitEvents = events
	}
}

// WithTitle ...
func WithTitle(title string) Option {
	return func(s *Step) {
		s.Title = title
	}
}

// WithLabel ...
func WithLabel(label string) Option {
	return func(s *Step) {
		s.Label = label
	}
}

// WithVisible ...
func WithVisible(visible bool) Option {
	return func(s *Step) {
		s.Visible = visible
	}
}

// WithRules ...
func WithRules(rules []string) Option {
	return func(s *Step) {
		s.Rules = rules
	}
}

// WithHandlers ...
func WithHandlers(handlers []kf.Handler) Option {
	return func(s *Step) {
		s.Handlers = handlers
	}
}

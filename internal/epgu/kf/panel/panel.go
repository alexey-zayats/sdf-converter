package panel

import (
	"bytes"
	"encoding/json"
	"sdf-converter/internal/epgu/kf"
	"strings"
)

// Panel ...
type Panel struct {
	ClassName    string          `json:"className,omitempty"`
	Name         string          `json:"name,omitempty"`
	FullPath     string          `json:"fullPath,omitempty"`
	Title        string          `json:"title,"`
	IsGrid       bool            `json:"isGrid,omitempty"`
	IsGridItem   bool            `json:"isGridItem,omitempty"`
	Visible      bool            `json:"visible,omitempty"`
	GridWidth    string          `json:"gridWidth,omitempty"`
	SubmitEvents kf.SubmitEvents `json:"submitEvents"`

	Items []kf.Item `json:"items,omitempty"`

	Rules    []string     `json:"rules,omitempty"`
	Handlers []kf.Handler `json:"handlers,omitempty"`

	Label    string `json:"label,omitempty"`
	Action   string `json:"action,omitempty"`
	Floating string `json:"floating,omitempty"`
	Balign   string `json:"balign,omitempty"`
}

// Option ...
type Option func(*Panel)

// NewPanel ...
func NewPanel(path []string, class string, opts ...Option) kf.Item {

	t := &Panel{
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
func (p *Panel) GetPath() []string {
	return strings.Split(p.FullPath, ".")
}

// GetItems ...
func (p *Panel) GetItems() []kf.Item {
	return p.Items
}

// GetItem ...
func (p *Panel) GetItem(idx int) kf.Item {
	if len(p.Items) > idx {
		return p.Items[idx]
	}
	return nil
}

// String ...
func (p *Panel) String() string {
	buffer := &bytes.Buffer{}
	encoder := json.NewEncoder(buffer)
	encoder.SetEscapeHTML(false)
	//encoder.SetIndent("", "  ")
	encoder.Encode(p)
	return buffer.String()
}

// AddItem ...
func (p *Panel) AddItem(items ...kf.Item) kf.Item {
	for _, item := range items {
		p.Items = append(p.Items, item)
	}
	return p
}

// WithTitle ...
func WithTitle(title string) Option {
	return func(p *Panel) {
		p.Title = title
	}
}

// WithVisible ...
func WithVisible(visible bool) Option {
	return func(p *Panel) {
		p.Visible = visible
	}
}

// WithGridWidth ...
func WithGridWidth(value string) Option {
	return func(p *Panel) {
		p.GridWidth = value
	}
}

// WithIsGrid ...
func WithIsGrid(value bool) Option {
	return func(p *Panel) {
		p.IsGrid = value
	}
}

// WithIsGridItem ...
func WithIsGridItem(value bool) Option {
	return func(p *Panel) {
		p.IsGridItem = value
	}
}

// WithLabel ...
func WithLabel(value string) Option {
	return func(p *Panel) {
		p.Label = value
	}
}

// WithAction ...
func WithAction(value string) Option {
	return func(p *Panel) {
		p.Action = value
	}
}

// WithBalign ...
func WithBalign(value string) Option {
	return func(p *Panel) {
		p.Balign = value
	}
}

// WithFloating ...
func WithFloating(value string) Option {
	return func(p *Panel) {
		p.Floating = value
	}
}

// WithHandlers ...
func WithHandlers(handlers []kf.Handler) Option {
	return func(p *Panel) {
		p.Handlers = handlers
	}
}

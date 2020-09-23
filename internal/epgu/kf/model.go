package kf

import "strings"

// Handler ...
type Handler map[string]interface{}

// SubmitEvents ...
type SubmitEvents map[string][]map[string]interface{}

// Dictionary ...
type Dictionary map[string]interface{}

// Validator ...
type Validator struct {
	Mnemonic string `json:"mnemonic,omitempty"`
	Message  string `json:"message,omitempty"`
}

// Item ...
type Item interface {
	GetItems() []Item
	GetItem(idx int) Item
	AddItem(items ...Item) Item
	GetPath() []string
	String() string
}

// Name ...
func Name(path []string) string {
	if len(path) > 0 {
		return path[len(path)-1]
	}
	return ""
}

// Path ...
func Path(path []string) string {
	return strings.Join(path, ".")
}

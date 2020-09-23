package sdf

import "go.mongodb.org/mongo-driver/bson/primitive"

// Service данные по услуге из СДФ
type Service struct {
	ID                   primitive.ObjectID `bson:"_id,omitempty"`
	Department           DBRef              `dept:"dept,omitempty"`
	InDocs               []DBRef            `bson:"in_docs,omitempty"`
	FieldGroups          []FieldGroup       `bson:"fieldGroups,omitempty"`
	CustomFields         []Field            `bson:"customFields,omitempty"`
	Number               string             `bson:"number,omitempty"`
	FullName             string             `bson:"fullName,omitempty"`
	ShortName            string             `bson:"shortName,omitempty"`
	ServiceIDSrgu        string             `bson:"serviceIdSrgu,omitempty"`
	ServicePassportIDSrg string             `bson:"servicePassportIdSrgu,omitempty"`
	ServiceDocs          []ServiceDoc       `bson:"docs,omitempty"`
}

// ServiceDoc ...
type ServiceDoc struct {
	ID          primitive.ObjectID `bson:"_id,omitempty"`
	Name        string             `bson:"name,omitempty"`
	Description string             `bson:"description,omitempty"`
	Requirement string             `bson:"documentRequirement,omitempty"`
}

// FieldGroup данне по группам полей формы услуги
type FieldGroup struct {
	ID          primitive.ObjectID `bson:"_id,omitempty"`
	Fields      []Field            `bson:"fields,omitempty"`
	Name        string             `bson:"name,omitempty"`
	Description string             `bson:"description,omitempty"`
	IsDisabled  bool               `bson:"isDisabled,omitempty"`
	IsHidden    bool               `bson:"isHidden,omitempty"`
}

// Field данные поля формы услуги
type Field struct {
	ID          primitive.ObjectID `bson:"_id,omitempty"`
	Type        string             `bson:"type,omitempty"`
	DisplayName string             `bson:"display_name,omitempty"`
	FieldID     string             `bson:"field_id,omitempty"`
	Combo       Combo              `bson:"combo,omitempty"`
	RadioGroup  RadioGroup         `bson:"radioGroup,omitempty"`
	Prompt      string             `bson:"prompt,omitempty"`
	IsRequired  bool               `bson:"isRequired,omitempty"`
	IsDisabled  bool               `bson:"isDisabled,omitempty"`
	IsHidden    bool               `bson:"isHidden,omitempty"`
}

// Combo данные для комбобокса
type Combo struct {
	Name   string  `bson:"name,omitempty"`
	Values []Value `bson:"values,omitempty"`
}

// Value данные одного элемента значения
type Value struct {
	Key   string `bson:"key,omitempty"`
	Value string `bson:"value,omitempty"`
}

// RadioGroup данные радио баттонов
type RadioGroup struct {
	Values []Value `bson:"values,omitempty"`
}

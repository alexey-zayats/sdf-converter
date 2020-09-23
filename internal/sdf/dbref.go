package sdf

// DBRef структура данных $ref из mongodb
type DBRef struct {
	Ref interface{} `bson:"$ref,omitempty"`
	ID  interface{} `bson:"$id,omitempty"`
	DB  interface{} `bson:"$db,omitempty"`
}

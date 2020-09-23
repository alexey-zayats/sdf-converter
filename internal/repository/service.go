package repository

import (
	"context"
	"github.com/pkg/errors"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"sdf-converter/internal/interfaces"
	"sdf-converter/internal/sdf"
)

// Service репозиторий доступа к услугам в mongodb
type Service struct {
	db         *mongo.Database
	collection *mongo.Collection
}

// NewService инициализация инстанса репозитория
func NewService(db *mongo.Database) interfaces.Service {
	return &Service{
		db:         db,
		collection: db.Collection("services"),
	}
}

// GetBySrguID ...
func (s *Service) GetBySrguID(ctx context.Context, srguID string) (*sdf.Service, error) {

	match := bson.D{{
		"$match", bson.M{"serviceIdSrgu": srguID},
	}}
	agg := bson.D{{
		"$lookup", bson.M{
			"from":         "service_docs",
			"localField":   "in_docs.$id",
			"foreignField": "_id",
			"as":           "docs",
		},
	}}

	var svc sdf.Service
	curr, err := s.collection.Aggregate(ctx, mongo.Pipeline{match, agg})
	if err != nil {
		return &svc, errors.Wrap(err, "unable aggregate")
	}
	defer curr.Close(ctx)

	if curr.Next(ctx) {
		err = curr.Decode(&svc)
	}

	return &svc, err
}

// CountAll возвращает общее количество услуг
func (s *Service) CountAll(ctx context.Context) (int64, error) {
	return s.collection.CountDocuments(ctx, bson.D{})
}

// GetWithLimit возвращает список услуг по окну сдвига
func (s *Service) GetWithLimit(ctx context.Context, limit, offset int64) ([]*sdf.Service, error) {

	op1 := bson.D{{
		"$limit", limit,
	}}

	op2 := bson.D{{
		"$skip", offset,
	}}

	op3 := bson.D{{
		"$sort", bson.D{{"_id", -1}},
	}}

	agg := bson.D{{
		"$lookup", bson.M{
			"from":         "service_docs",
			"localField":   "in_docs.$id",
			"foreignField": "_id",
			"as":           "docs",
		},
	}}

	cursor, err := s.collection.Aggregate(ctx, mongo.Pipeline{op2, op1, op3, agg})
	if err != nil {
		return nil, errors.Wrap(err, "unable aggregate")
	}
	defer cursor.Close(ctx)

	result := make([]*sdf.Service, 0)

	for cursor.Next(ctx) {
		var record sdf.Service
		if err := cursor.Decode(&record); err != nil {
			return nil, errors.Wrap(err, "unable to decode service")
		}
		result = append(result, &record)
	}

	return result, nil
}

package mongodb

import (
	"context"
	"github.com/sirupsen/logrus"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
	"go.uber.org/dig"
	"sdf-converter/internal/config"
)

// Db хранит DSN и соединение с MongoDB
type Db struct {
	dsn      string
	name     string
	client   *mongo.Client
	database *mongo.Database
}

// DBDi содержит зависимые структуры для DI
type DBDi struct {
	dig.In
	Config *config.Config
}

// NewDB создает экземпляр работы с MongoDB
func NewDB(in DBDi) *Db {
	return &Db{
		dsn:  in.Config.Mongo.DSN,
		name: in.Config.Mongo.DB,
	}
}

// GetConnection возвращает соединение с БД
func (db *Db) GetConnection() (*mongo.Client, error) {

	if db.client != nil {
		return db.client, nil
	}

	client, err := mongo.Connect(context.Background(), options.Client().ApplyURI(db.dsn))
	if err != nil {
		logrus.WithError(err).Error("unable to connect")
		return nil, err
	}

	db.client = client

	return db.client, nil
}

// GetDatabase возвращает объект для работы с БД
func (db *Db) GetDatabase() (*mongo.Database, error) {
	var err error

	if db.database != nil {
		return db.database, err
	}

	client, err := db.GetConnection()
	if err != nil {
		return db.database, err
	}
	db.database = client.Database(db.name)

	return db.database, err
}

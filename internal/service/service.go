package service

import (
	"context"
	"github.com/pkg/errors"
	"go.uber.org/dig"
	"sdf-converter/internal/interfaces"
	"sdf-converter/internal/mongodb"
	"sdf-converter/internal/repository"
	"sdf-converter/internal/sdf"
)

// Service сервис работы с услугами
type Service struct {
	repo interfaces.Service
}

// ParamsService DI-параметры сервиса
type ParamsService struct {
	dig.In
	DB *mongodb.Db
}

// NewService инициализация инстанса сервиса
func NewService(di ParamsService) (*Service, error) {

	conn, err := di.DB.GetDatabase()
	if err != nil {
		return nil, errors.Wrap(err, "unable get database")
	}

	s := &Service{
		repo: repository.NewService(conn),
	}
	return s, nil
}

// GetBySrguID ...
func (s *Service) GetBySrguID(ctx context.Context, srguID string) (*sdf.Service, error) {
	return s.repo.GetBySrguID(ctx, srguID)
}

// CountAll возвращает количество услуг
func (s *Service) CountAll(ctx context.Context) (int64, error) {
	return s.repo.CountAll(ctx)
}

// GetWithLimit возвращает список услуг по сдвигу
func (s *Service) GetWithLimit(ctx context.Context, limit, offset int64) ([]*sdf.Service, error) {
	return s.repo.GetWithLimit(ctx, limit, offset)
}

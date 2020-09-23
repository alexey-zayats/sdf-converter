package interfaces

import (
	"context"
	"sdf-converter/internal/sdf"
)

// Service интерфейс получения данных по услугам
type Service interface {
	CountAll(ctx context.Context) (int64, error)
	GetWithLimit(ctx context.Context, limit, offset int64) ([]*sdf.Service, error)
	GetBySrguID(ctx context.Context, srguID string) (*sdf.Service, error)
}

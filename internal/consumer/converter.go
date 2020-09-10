package consumer

import (
	"context"
	"github.com/sirupsen/logrus"
	"go.uber.org/dig"
	"sdf-converter/internal/config"
	"sdf-converter/internal/mongodb"
	"sync"
)

// Converter хранит данные конвертера Config и WaitGroup
type Converter struct {
	wg *sync.WaitGroup

	mongo *mongodb.Db

	workers int
}

// ConverterDI стурктура для DI
type ConverterDI struct {
	dig.In
	Config *config.Config
	Mongo  *mongodb.Db
}

// NewConverter создает новый экземпляр конвертера
func NewConverter(di ConverterDI) (Consumer, error) {
	c := &Converter{
		wg:      &sync.WaitGroup{},
		workers: di.Config.Workers,
		mongo:   di.Mongo,
	}

	return c, nil
}

// Run запускает конвертер
func (c *Converter) Run(ctx context.Context, args []string) {

	logrus.WithFields(logrus.Fields{}).Debug("run converter")



	for i := 0; i < c.workers; i++ {
		c.wg.Add(1)
		go c.worker(ctx, i)
	}

	c.wg.Wait()
}

func (c *Converter) worker(ctx context.Context, worker int) {

	defer c.wg.Done()

	logrus.WithFields(logrus.Fields{"worker": worker}).Debug("start converter worker")

	for {
		select {
		case <-ctx.Done():
			logrus.WithFields(logrus.Fields{"worker": worker}).Debug("converter worker canceled by ctx")
			return
		}
	}
}

package consumer

import (
	"context"
	"github.com/sirupsen/logrus"
	"go.uber.org/dig"
	"sdf-converter/internal/config"
	"sdf-converter/internal/converter"
	"sdf-converter/internal/mongodb"
	"sdf-converter/internal/registry"
	"sdf-converter/internal/service"
	"sync"
)

// Converter хранит данные конвертера Config и WaitGroup
type Converter struct {
	wg *sync.WaitGroup

	mongo *mongodb.Db

	workers int

	registryChan chan *registry.Registry

	cfg *config.Config

	serviceSvc     *service.Service
	converter      *converter.Converter
	registryParser *registry.Parser
}

// ConverterDI стурктура для DI
type ConverterDI struct {
	dig.In
	Config         *config.Config
	Mongo          *mongodb.Db
	Service        *service.Service
	Converter      *converter.Converter
	RegistryParser *registry.Parser
}

// NewConverter создает новый экземпляр конвертера
func NewConverter(di ConverterDI) (Consumer, error) {
	c := &Converter{
		wg:             &sync.WaitGroup{},
		workers:        di.Config.Workers,
		mongo:          di.Mongo,
		cfg:            di.Config,
		serviceSvc:     di.Service,
		converter:      di.Converter,
		registryParser: di.RegistryParser,
		registryChan:   make(chan *registry.Registry),
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

	c.wg.Add(1)
	go c.registry(ctx)

	c.wg.Wait()
}

func (c *Converter) end() {
	for i := 0; i < c.workers; i++ {
		c.registryChan <- nil
	}
}

func (c *Converter) registry(ctx context.Context) {

	logrus.Debug("run registry parser proc")

	defer func() {
		logrus.Debug("registry parser finished")
		c.wg.Done()
	}()

	select {
	case <-ctx.Done():
		return

	default:
		if err := c.registryParser.Parse(c.cfg.Registry, c.registryChan); err != nil {
			logrus.WithError(err).Errorf("unable parse registry file %s", c.cfg.Registry)
		}
		c.end()
	}
}

func (c *Converter) worker(ctx context.Context, worker int) {

	defer func() {
		logrus.WithFields(logrus.Fields{"worker": worker}).Debug("converter worker finished")
		c.wg.Done()
	}()

	logrus.WithFields(logrus.Fields{"worker": worker}).Debug("start converter worker")

	for {
		select {
		case <-ctx.Done():
			return
		case record := <-c.registryChan:

			if record == nil {
				return
			}

			var err error
			record.SDF, err = c.serviceSvc.GetBySrguID(ctx, record.ServiceTargetID)
			if err != nil {
				logrus.WithError(err).Errorf("unable call serviceSvc.GetBySrguID(%s)", record.ServiceTargetID)
				continue
			}

			if record.SDF.ServiceIDSrgu == "" {
				logrus.WithFields(logrus.Fields{
					"ServiceTargetID": record.ServiceTargetID,
				}).Error("unable to get service from SDF")
				continue
			}

			if err := c.converter.Convert(ctx, record); err != nil {
				logrus.WithError(err).Errorf("unable call converter.Convert for %s", record.ServiceTargetID)
				continue
			}
		}
	}
}

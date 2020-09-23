package di

import (
	"context"
	"github.com/sirupsen/logrus"
	"go.uber.org/dig"
	"os"
	"os/signal"
	"syscall"
)

// Runner содержит данные для инициализации зависимостей через DI и метод запуска
type Runner struct {
	Provide map[string]interface{}
	Invoke  func(context.Context, []string) interface{}
}

// Run запускает консьюмер, инициализируя зависимости. Устанавливает обработчик сигналов для graceful shutdown
func (r *Runner) Run(ctx context.Context, args []string) {

	signalChan := make(chan os.Signal)
	signal.Notify(signalChan, syscall.SIGINT, syscall.SIGABRT, syscall.SIGHUP, syscall.SIGTERM)

	childCtx, cancel := context.WithCancel(ctx)

	go r.catchSignal(cancel, signalChan)

	// Init Di container
	container := dig.New()

	for name, iface := range r.Provide {
		if err := container.Provide(iface); err != nil {
			logrus.Fatalf("%: %s", name, err.Error())
		}
	}

	// Invoke from di
	if err := container.Invoke(r.Invoke(childCtx, args)); err != nil {
		logrus.Fatalf("unable invoke runner interfaces: %s", err.Error())
	}

}

func (r *Runner) catchSignal(cancel context.CancelFunc, signalChan chan os.Signal) {

	sig := <-signalChan

	logrus.WithFields(logrus.Fields{}).Debugf("got signal %+v", sig)

	cancel()
}

package cmd

import (
	"context"
	"github.com/spf13/cobra"
	"sdf-converter/internal/config"
	"sdf-converter/internal/consumer"
	"sdf-converter/internal/di"
	"sdf-converter/internal/mongodb"
)

var converterCmd = &cobra.Command{
	Use:   "converter",
	Short: "converter",
	Long:  "converter",
	Run:   converterMain,
}

func init() {
	rootCmd.AddCommand(converterCmd)

	params := []config.Param{}

	config.Apply(converterCmd, params)
}

func converterMain(cmd *cobra.Command, args []string) {
	ctx := context.Background()

	di := &di.Runner{
		Provide: map[string]interface{}{
			"config":             config.NewConfig,
			"mongodb.NewDB":      mongodb.NewDB,
			"consumer.Converter": consumer.NewConverter,
		},
		Invoke: func(ctx context.Context, args []string) interface{} {
			return func(i consumer.Consumer) {
				i.Run(ctx, args)
			}
		},
	}

	di.Run(ctx, args)
}

package cmd

import (
	"context"
	"github.com/spf13/cobra"
	"sdf-converter/internal/artefact"
	"sdf-converter/internal/config"
	"sdf-converter/internal/consumer"
	"sdf-converter/internal/converter"
	"sdf-converter/internal/di"
	"sdf-converter/internal/epgu/kf/form"
	"sdf-converter/internal/mongodb"
	"sdf-converter/internal/registry"
	"sdf-converter/internal/service"
)

var converterCmd = &cobra.Command{
	Use:   "converter",
	Short: "converter",
	Long:  "converter",
	Run:   converterMain,
}

func init() {
	rootCmd.AddCommand(converterCmd)

	params := []config.Param{
		{Name: "converter-registry", Value: "/tmp/sdf/registry.xlsx", Usage: "path to services registry", ViperBind: "Converter.Registry"},

		{Name: "converter-dir-template", Value: "/tmp/sdf/template", Usage: "path to templates dir", ViperBind: "Converter.Dir.Template"},
		{Name: "converter-dir-artefact", Value: "/tmp/sdf/template", Usage: "path to artefact dir", ViperBind: "Converter.Dir.Artefact"},
		{Name: "converter-dir-tmp", Value: "/tmp/sdf/tmp", Usage: "path to tmp dir", ViperBind: "Converter.Dir.Tmps"},
	}

	config.Apply(converterCmd, params)
}

func converterMain(cmd *cobra.Command, args []string) {
	ctx := context.Background()

	di := &di.Runner{
		Provide: map[string]interface{}{
			"config":                config.NewConfig,
			"mongodb.NewDB":         mongodb.NewDB,
			"service.Service":       service.NewService,
			"registry.NewParser":    registry.NewParser,
			"form.NewBuilder":       form.NewBuilder,
			"artefact.NewTemplates": artefact.NewTemplates,
			"artefact.NewContent":   artefact.NewContent,
			"artefact.NewFolders":   artefact.NewFolders,
			"converter.Converter":   converter.NewConverter,
			"consumer.Converter":    consumer.NewConverter,
		},
		Invoke: func(ctx context.Context, args []string) interface{} {
			return func(i consumer.Consumer) {
				i.Run(ctx, args)
			}
		},
	}

	di.Run(ctx, args)
}

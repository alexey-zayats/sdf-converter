package cmd

import (
	"fmt"
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"os"
	"sdf-converter/internal/config"
	"strings"
)

var rootCmd = &cobra.Command{
	Use:   "sdf-converter",
	Short: "sdf-converter",
	Long:  "sdf-converter",
	Run:   rootMain,
}

// Execute entry point to cobra
func Execute() {
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

// Show cmd usage & exit
func usage(cmd *cobra.Command) {
	if err := cmd.Help(); err != nil {
		logrus.Fatal(err)
	}
	os.Exit(0)
}

func init() {

	cfgParams := []config.Param{

		{Name: "log-level", Value: "info", Usage: "log level", ViperBind: "Log.Level"},

		{Name: "mongo-dsn", Value: "mongodb://converter:converter@127.0.0.1:27017/", Usage: "Mongodb datasource", ViperBind: "Mongo.DSN"},
		{Name: "mongo-db", Value: "crawler", Usage: "AMQP datasource", ViperBind: "Mongo.DB"},

		{Name: "workers", Value: 8, Usage: "number of workers", ViperBind: "Workers"},
	}

	viper.SetEnvPrefix(config.EnvPrefix)
	viper.SetEnvKeyReplacer(strings.NewReplacer(".", "_"))

	config.Apply(rootCmd, cfgParams)

	viper.AutomaticEnv()

	rootCmd.PersistentFlags().StringVar(&config.ConfigFile, "config", "./config/sdf-converter.yaml", "Config file")
	cobra.OnInitialize(config.Init)
}

func rootMain(cmd *cobra.Command, args []string) {
	if err := cmd.Help(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

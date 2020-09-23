package artefact

import (
	"github.com/pkg/errors"
	"go.uber.org/dig"
	"os"
	"path"
	"sdf-converter/internal/config"
)

// Folders ...
type Folders struct {
	rootDir string
	data    map[string]string
}

// FoldersDI ...
type FoldersDI struct {
	dig.In
	Config *config.Config
}

// NewFolders ...
func NewFolders(root string, fromCode string) *Folders {

	data := map[string]string{
		"coresvc":          path.Join(root, "coresvc"),
		"coresvc/rollback": path.Join(root, "coresvc", "rollback"),

		"forms":                  path.Join(root, fromCode),
		"forms/svcform":          path.Join(root, fromCode, "svcform"),
		"forms/svcform/rollback": path.Join(root, fromCode, "svcform", "rollback"),

		"forms/svcspec":          path.Join(root, fromCode, "svcspec"),
		"forms/svcspec/rollback": path.Join(root, fromCode, "svcspec", "rollback"),
	}

	return &Folders{
		rootDir: root,
		data:    data,
	}
}

// Cleanup ...
func (f *Folders) Cleanup() error {
	if err := os.RemoveAll(f.rootDir); err != nil {
		return errors.Wrapf(err, "unable to call os.RemoveAll(%s)", f.rootDir)
	}
	return nil
}

// Struct ...
func (f *Folders) Struct() map[string]string {
	return f.data
}

// MakeStruct ...
func (f *Folders) MakeStruct() error {

	if err := os.MkdirAll(f.data["coresvc/rollback"], os.ModePerm); err != nil {
		return errors.Wrapf(err, "unable call os.MkdirAll(%s)", f.data["coresvc/rollback"])
	}

	if err := os.MkdirAll(f.data["forms/svcform/rollback"], os.ModePerm); err != nil {
		return errors.Wrapf(err, "unable call os.MkdirAll(%s)", f.data["forms/svcspec/rollback"])
	}

	if err := os.MkdirAll(f.data["forms/svcspec/rollback"], os.ModePerm); err != nil {
		return errors.Wrapf(err, "unable call os.MkdirAll(%s)", f.data["forms/svcspec/rollback"])
	}

	return nil
}

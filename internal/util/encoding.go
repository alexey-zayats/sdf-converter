package util

import (
	"golang.org/x/text/encoding/charmap"
	"golang.org/x/text/transform"
	"io/ioutil"
	"strings"
)

// UTF8toCP1251 ...
func UTF8toCP1251(s string) string {
	r := strings.NewReader(s)
	tr := transform.NewReader(r, charmap.Windows1251.NewEncoder())
	buf, _ := ioutil.ReadAll(tr)
	return string(buf)
}

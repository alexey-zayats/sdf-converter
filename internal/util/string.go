package util

import "unicode/utf8"

// RunIndex ...
func RunIndex(s string, edge int) int {
	step := 0
	idx := 0
	for i, w := 0, 0; i < len(s); i += w {
		step++
		_, w = utf8.DecodeRuneInString(s[i:])
		if step == edge {
			idx = i + w
			break
		}
	}
	return idx
}

package monitoringsuiteuseapp

import (
	"fmt"
	"runtime"
)

var (
	Version  = "0.1.0"
	Revision = "xxxxxx" // set on build time
)

func FullVersion() string {
	return fmt.Sprintf("v%s %s/%s, build %s", Version, runtime.GOOS, runtime.GOARCH, Revision)
}

package example

import "go.k6.io/k6/v2/output"

func init() {
	output.RegisterExtension("example", newOutput)
}

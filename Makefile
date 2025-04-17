all: lint security test build it

lint:
	golangci-lint run ./...

security:
	gosec -quiet ./...
	govulncheck ./...

test:
	go test -cover -race ./...

build:
	xk6 build --with github.com/grafana/xk6-output-example=.

it: build
	XK6_EXAMPLE_INTERVAL=100ms ./k6 run -o example=test.csv test.js

.PHONY: all lint security test build it
.SILENT:

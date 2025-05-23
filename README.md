# xk6-output-example

**Example k6 output extension**

This k6 extension showcases how to develop a k6 Output extension. It serves as the basis for new Output extensions created with the `xk6 new` command. Additionally, this repository functions as a GitHub template for creating k6 output extension repositories.

**script.sh**
```shell file=script.sh
XK6_EXAMPLE_INTERVAL=10s ./k6 run -o example=script.csv script.js
```

**script.js**
```javascript file=script.js
import http from 'k6/http';
import { sleep } from 'k6';

export let options = {
  discardResponseBodies: true,
  scenarios: {
    contacts: {
      executor: "constant-vus",
      vus: 2,
      duration: "30s",
    },
  },
};

export default function () {
  http.get('https://quickpizza.grafana.com');

  sleep(.5);
}
```

## Download

Building a custom k6 binary with the `xk6-output-example` extension is necessary for its use. You can download pre-built k6 binaries from the [Releases page](https://github.com/grafana/xk6-output-example/releases/).

## Build

The recommended way to build a custom k6 binary with the `xk6-output-example` extension is by using the provided Docker image for the [xk6](https://github.com/grafana/xk6) tool.

Linux

```shell
docker run --rm -it -u "$(id -u):$(id -g)" -v "${PWD}:/xk6" grafana/xk6 build --with github.com/grafana/xk6-output-example
```

macOS

```shell
docker run --rm -it -u "$(id -u):$(id -g)" -v "${PWD}:/xk6" grafana/xk6 build --os darwin --with github.com/grafana/xk6-output-example
```

Windows (PowerShell)

```shell
docker run --rm -it -u "$(id -u):$(id -g)" -v "${PWD}:/xk6" grafana/xk6 build --os windows --with github.com/grafana/xk6-output-example --output k6.exe
```

Windows (cmd.exe)

```
docker run --rm -it -v "%cd%:/xk6" grafana/xk6 build --os windows --with github.com/grafana/xk6-output-example --output k6.exe
```

## Contribute

If you wish to contribute to this project, please start by reading the [Contributing Guidelines](http://CONTRIBUTING.md).


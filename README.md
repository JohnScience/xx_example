# Example Rust containerized application using `xx`

## About `xx`

> xx provides tools to support cross-compilation from Dockerfiles that understand the --platform flag passed in from docker build or docker buildx build. These helpers allow you to build multi-platform images from any architecture into any architecture supported by your compiler with native performance. Adding xx to your Dockerfile should only need minimal updates and should not require custom conditions for specific architectures.

## About cross-compilation

Cross-compilation is surprisingly complex. There are many ways to fail, and the error messages are often cryptic. The xx crate is designed to make cross-compilation as easy as possible.

## Running the example

```console
docker build -t app . && docker run --rm app & docker rmi app
```

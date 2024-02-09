FROM --platform=$BUILDPLATFORM tonistiigi/xx AS xx

FROM --platform=$BUILDPLATFORM rust:alpine AS build
COPY --from=xx / /
RUN apk add clang lld
# ...
ARG TARGETPLATFORM
ADD src /src
ADD Cargo.toml /Cargo.toml
RUN xx-cargo build --release --target-dir ./build && \
    xx-verify ./build/$(xx-cargo --print-target-triple)/release/xx_example && \
    mv /build/$(xx-cargo --print-target-triple) /build/target_triple

# consider stripping the binary and other things
RUN strip /build/target_triple/release/xx_example

FROM --platform=$BUILDPLATFORM alpine AS runtime
COPY --from=build /build/target_triple/release/xx_example /bin/xx_example

ENTRYPOINT ["xx_example" ]

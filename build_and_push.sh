docker buildx build --push \
  --tag rjst/capnp-builder-2:capnp-0.10.4 \
  --platform linux/amd64,linux/arm64 .

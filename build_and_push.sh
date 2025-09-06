docker buildx build --push \
  --tag rjst/capnp-builder-2:capnp-1.2.0 \
  --platform linux/amd64,linux/arm64 .

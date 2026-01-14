#!/bin/bash

set -ex

mkdir -p tmp
# Using v4 API for compatibility with old podman installs
curl https://storage.googleapis.com/libpod-master-releases/swagger-v4.0.0.yaml > ./tmp/openapi.yaml

# https://github.com/OpenAPITools/openapi-generator/blob/master/docs/generators/elixir.md
podman run --rm \
    -v $PWD:/local openapitools/openapi-generator-cli generate \
    -i /local/tmp/openapi.yaml \
    --generator-name elixir \
    -o /local/generated \
    --skip-validate-spec \
    --package-name podman-openapi

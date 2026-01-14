# ProvidesAnAPIForTheLibpodLibrary

This documentation describes the Podman v2.0 RESTful API. It replaces the Podman v1.0 API and was initially delivered along with Podman v2.0.  It consists of a Docker-compatible API and a Libpod API providing support for Podman’s unique features such as pods.  To start the service and keep it running for 5,000 seconds (-t 0 runs forever):  podman system service -t 5000 &amp;  You can then use cURL on the socket using requests documented below.  NOTE: if you install the package podman-docker, it will create a symbolic link for /run/docker.sock to /run/podman/podman.sock  NOTE: some fields in the API response JSON are set as omitempty, which means that if there is no value set for them, they will not show up in the API response. This is a feature to help reduce the size of the JSON responses returned via the API.  NOTE: due to the limitations of [go-swagger](https://github.com/go-swagger/go-swagger), some field values that have a complex type show up as null in the docs as well as in the API responses. This is because the zero value for the field type is null. The field description in the docs will state what type the field is expected to be for such cases.  See podman-service(1) for more information.  Quick Examples:  &#39;podman info&#39;  curl --unix-socket /run/podman/podman.sock http://d/v3.0.0/libpod/info  &#39;podman pull quay.io/containers/podman&#39;  curl -XPOST --unix-socket /run/podman/podman.sock -v &#39;http://d/v3.0.0/images/create?fromImage&#x3D;quay.io%2Fcontainers%2Fpodman&#39;  &#39;podman list images&#39;  curl --unix-socket /run/podman/podman.sock -v &#39;http://d/v3.0.0/libpod/images/json&#39; | jq

## Building

To install the required dependencies and to build the elixir project, run:

```console
mix local.hex --force
mix do deps.get, compile
```

## Installation

If [available in Hex][], the package can be installed by adding `podman_openapi` to
your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:podman_openapi, "~> 1.0.0"}]
end
```

Documentation can be generated with [ExDoc][] and published on [HexDocs][]. Once published, the docs can be found at
[https://hexdocs.pm/podman_openapi][docs].

## Configuration

You can override the URL of your server (e.g. if you have a separate development and production server in your
configuration files).

```elixir
config :podman_openapi, base_url: "http://podman.io"
```

Multiple clients for the same API with different URLs can be created passing different `base_url`s when calling
`ProvidesAnAPIForTheLibpodLibrary.Connection.new/1`:

```elixir
client = ProvidesAnAPIForTheLibpodLibrary.Connection.new(base_url: "http://podman.io")
```

[exdoc]: https://github.com/elixir-lang/ex_doc
[hexdocs]: https://hexdocs.pm
[available in hex]: https://hex.pm/docs/publish
[docs]: https://hexdocs.pm/podman_openapi

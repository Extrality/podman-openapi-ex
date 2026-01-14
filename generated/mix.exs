defmodule ProvidesAnAPIForTheLibpodLibrary.Mixfile do
  use Mix.Project

  def project do
    [
      app: :podman_openapi,
      version: "1.0.0",
      elixir: "~> 1.18",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      description: """
      This documentation describes the Podman v2.0 RESTful API. It replaces the Podman v1.0 API and was initially delivered along with Podman v2.0.  It consists of a Docker-compatible API and a Libpod API providing support for Podman’s unique features such as pods.  To start the service and keep it running for 5,000 seconds (-t 0 runs forever):  podman system service -t 5000 &amp;  You can then use cURL on the socket using requests documented below.  NOTE: if you install the package podman-docker, it will create a symbolic link for /run/docker.sock to /run/podman/podman.sock  NOTE: some fields in the API response JSON are set as omitempty, which means that if there is no value set for them, they will not show up in the API response. This is a feature to help reduce the size of the JSON responses returned via the API.  NOTE: due to the limitations of [go-swagger](https://github.com/go-swagger/go-swagger), some field values that have a complex type show up as null in the docs as well as in the API responses. This is because the zero value for the field type is null. The field description in the docs will state what type the field is expected to be for such cases.  See podman-service(1) for more information.  Quick Examples:  &#39;podman info&#39;  curl --unix-socket /run/podman/podman.sock http://d/v3.0.0/libpod/info  &#39;podman pull quay.io/containers/podman&#39;  curl -XPOST --unix-socket /run/podman/podman.sock -v &#39;http://d/v3.0.0/images/create?fromImage&#x3D;quay.io%2Fcontainers%2Fpodman&#39;  &#39;podman list images&#39;  curl --unix-socket /run/podman/podman.sock -v &#39;http://d/v3.0.0/libpod/images/json&#39; | jq
      """,
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      extra_applications: [:logger],
      mod: {ProvidesAnAPIForTheLibpodLibrary.Application, []}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.3.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:tesla, "~> 1.14"},
      {:finch, "~> 0.19"},
      {:ex_doc, "~> 0.37.3", only: :dev, runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false}
    ]
  end

  defp package do
    [
      name: "podman_openapi",
      files: ~w(.formatter.exs config lib mix.exs README* LICENSE*)
    ]
  end
end

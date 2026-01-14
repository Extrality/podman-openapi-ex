# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :podman_openapi, base_url: "http://podman.io"

# Configure Tesla to use Finch adapter for streaming support
config :tesla, :adapter, {Tesla.Adapter.Finch, name: PodmanOpenAPI.Finch}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
#
# import_config "#{config_env()}.exs"

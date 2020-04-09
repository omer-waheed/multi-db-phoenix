# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :multi,
  ecto_repos: [Multi.Repo]

# Configures the endpoint
config :multi, Multi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MLQam5HF2GJB2x6rTISbzi2X8afNn/P0zIU6Es85gVp7M89SmnERYPMuaM/htjpe",
  render_errors: [view: Multi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Multi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

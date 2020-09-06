# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :weather_info,
  ecto_repos: [WeatherInfo.Repo]

# Configures the endpoint
config :weather_info, WeatherInfoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qjxO/1m0YbTwNMKNpPuIF0lhZQtgtdH75h7qI4U6q5JpRKtEsR5F7eGl5IJ1RNuj",
  render_errors: [view: WeatherInfoWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: WeatherInfo.PubSub,
  live_view: [signing_salt: "tZaBt0fV"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

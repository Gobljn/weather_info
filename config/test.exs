use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :weather_info, WeatherInfo.Repo,
  username: "docker",
  password: "docker",
  database: "weather_info_test",
  hostname: "localhost",
  port: 5433,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :weather_info, WeatherInfoWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Use mock adapter for all clients
config :tesla, adapter: Tesla.Mock

config :weather_info, :openweather_credentials,
  api_key: "fake_api_key"

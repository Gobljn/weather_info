defmodule WeatherInfo.Repo do
  use Ecto.Repo,
    otp_app: :weather_info,
    adapter: Ecto.Adapters.Postgres
end

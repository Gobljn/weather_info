defmodule WeatherInfo.Fetcher do
  use Tesla, only: [:get]

  alias WeatherInfo.Weather

  plug Tesla.Middleware.BaseUrl, "https://api.openweathermap.org"
  plug Tesla.Middleware.JSON

  def get_data(%{city: city}) do
    {:ok, response} =
      get("/data/2.5/weather",
        query: [q: city, appid: api_key(), units: "metric"]
      )

    response.body
  end

  defp api_key() do
    Application.fetch_env!(:weather_info, :openweather_credentials)
    |> Keyword.fetch!(:api_key)
  end

  defp transform_data(%{} = data) do
    %Weather{
      description: hd(data["weather"])["description"],
      temperature: data["main"]["feels_like"],
      pressure: data["main"]["pressure"],
      humidity: data["main"]["humidity"]
    }
  end
end

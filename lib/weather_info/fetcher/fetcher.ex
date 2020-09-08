defmodule WeatherInfo.Fetcher do
  use Tesla, only: [:get]

  alias WeatherInfo.Weather

  plug Tesla.Middleware.BaseUrl, "https://api.openweathermap.org"
  plug Tesla.Middleware.JSON

  def get_data(%{city: city}) do
    {:ok, response} =
      get("/data/2.5/weather",
        query: [q: city, appid: "6f7ada94800f9eeb89afbbe3f7a89ff4", units: "metric"]
      )
    response.body
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

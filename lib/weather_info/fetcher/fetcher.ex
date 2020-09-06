defmodule WeatherInfo.Fetcher do
  use Tesla, only: [:get]

  plug Tesla.Middleware.BaseUrl, "https://api.openweathermap.org"
  plug Tesla.Middleware.JSON

  def get_current_data(%{city: city}) do
    {:ok, response} =
      get("/data/2.5/weather",
        query: [q: city, appid: "6f7ada94800f9eeb89afbbe3f7a89ff4", units: "metric"]
      )
    new_data = transform_data response.body
    IO.inspect("#{inspect new_data}")
  end

  # LEARN: where put alias?
  alias WeatherInfo.Weather

  defp transform_data(%{} = data) do
    %Weather{
      description: hd(data["weather"])["description"],
      temperature: data["main"]["feels_like"],
      pressure: data["main"]["pressure"],
      humidity: data["main"]["humidity"]
    }
  end
end

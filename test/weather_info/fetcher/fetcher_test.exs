defmodule WeatherInfo.FetcherTest do
  use ExUnit.Case

  alias WeatherInfo.Fetcher

  setup do
    Tesla.Mock.mock(fn
      %{
        method: _get,
        url: "https://api.openweathermap.org/data/2.5/weather"
      } ->
        %Tesla.Env{
          body: "ok",
          method: :get,
          status: 200
        }
    end)

    :ok
  end

  test "get correctly data from openWeather API mock" do
    assert Fetcher.get_data(%{city: "milano"}) == "ok"
  end
end

defmodule WeatherInfo.WeatherTest do
  use ExUnit.Case

  alias WeatherInfo.MockData
  alias WeatherInfo.Weather

  test "transform data get from fetcher in weather struct" do
    in_data = MockData.generate_weather()

    expected_data = %Weather{
      description: "few clouds",
      temperature: 28.55,
      pressure: 1025,
      humidity: 51
    }

    assert Weather.transform_data(in_data) == expected_data
  end
end

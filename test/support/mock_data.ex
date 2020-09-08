defmodule WeatherInfo.MockData do
  def generate_weather() do
    %{
      "base" => "stations",
      "clouds" => %{"all" => 20},
      "cod" => 200,
      "coord" => %{"lat" => 45.46, "lon" => 9.19},
      "dt" => 1_599_574_987,
      "id" => 3_173_435,
      "main" => %{
        "feels_like" => 28.55,
        "humidity" => 51,
        "pressure" => 1025,
        "temp" => 27.2,
        "temp_max" => 27.78,
        "temp_min" => 26.67
      },
      "name" => "Milan",
      "sys" => %{
        "country" => "IT",
        "id" => 6742,
        "sunrise" => 1_599_540_818,
        "sunset" => 1_599_587_302,
        "type" => 1
      },
      "timezone" => 7200,
      "visibility" => 10000,
      "weather" => [
        %{"description" => "few clouds", "icon" => "02d", "id" => 801, "main" => "Clouds"}
      ],
      "wind" => %{"deg" => 0, "speed" => 1}
    }
  end
end

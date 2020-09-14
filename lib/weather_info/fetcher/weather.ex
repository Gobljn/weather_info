defmodule WeatherInfo.Weather do

  @derive Jason.Encoder
  defstruct [:description, :temperature, :pressure, :humidity]

  def transform_data(%{} = data) do
    %__MODULE__{
      description: hd(data["weather"])["description"],
      temperature: data["main"]["feels_like"],
      pressure: data["main"]["pressure"],
      humidity: data["main"]["humidity"]
    }
  end
end

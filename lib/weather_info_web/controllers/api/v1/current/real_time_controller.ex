defmodule WeatherInfoWeb.Api.V1.Current.RealTimeController do
  use WeatherInfoWeb, :controller

  alias WeatherInfo.Weather
  alias WeatherInfo.Fetcher

  def show(conn, %{"id" => city}) do
    in_data = Fetcher.get_data(%{city: city})
    fin_data = Weather.transform_data(in_data)
    render(conn, "show.json", weather: fin_data)
  end
end

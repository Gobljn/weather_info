defmodule WeatherInfoWeb.Api.V1.Current.RealTimeView do
  use WeatherInfoWeb, :view

  def render("show.json", %{weather: weather}) do
    %{data: weather}
  end
end

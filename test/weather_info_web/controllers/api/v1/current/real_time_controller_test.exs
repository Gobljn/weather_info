defmodule WeatherInfoWeb.Api.V1.Current.RealTimeController.Test do
  use WeatherInfoWeb.ConnCase

  alias WeatherInfoWeb.Router.Helpers, as: Routes
  alias WeatherInfoWeb.Endpoint
  alias WeatherInfo.MockData

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}

    Tesla.Mock.mock(fn
      %{
        method: _get,
        url: "https://api.openweathermap.org/data/2.5/weather"
      } ->
        %Tesla.Env{
          body: MockData.generate_weather(),
          method: :get,
          status: 200
        }
    end)

    :ok
  end

  describe "show" do
    test "get current weather of the city", %{conn: conn} do

      request_path = Routes.api_v1_current_time_path(Endpoint, :show, "pavia")
      conn = get(conn, request_path)

      expected_data = %{
        "description" => "few clouds",
        "humidity" => 51,
        "pressure" => 1025,
        "temperature" => 28.55
      }

      assert json_response(conn, 200)["data"] == expected_data
    end
  end
end

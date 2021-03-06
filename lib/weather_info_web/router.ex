defmodule WeatherInfoWeb.Router do
  use WeatherInfoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", WeatherInfoWeb.Api.V1, as: :api_v1 do
    pipe_through :api

    scope "/current", Current, as: :current do
      resources "/city", RealTimeController, as: :time, only: [:show]
    end

    # Here will be the router path for forecast operations.
    # scope "/forecast", WeatherInfoWeb.Forecast, as: forecast do

    # end
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: WeatherInfoWeb.Telemetry
    end
  end
end

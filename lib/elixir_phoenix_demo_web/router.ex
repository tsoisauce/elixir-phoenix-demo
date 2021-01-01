defmodule ElixirPhoenixDemoWeb.Router do
  use ElixirPhoenixDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html", "text", "json"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug ElixirPhoenixDemoWeb.Plugs.Locale, "en"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixirPhoenixDemoWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController

    # Test JSON and redirects
    get "/redirect_internal", PageController, :redirect_internal
    get "redirect_external", PageController, :redirect_external
    get "/test_json", PageController, :json_test
    get "/redirect_test", PageController, :redirect_test

    # Hello pages
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirPhoenixDemoWeb do
  #   pipe_through :api
  # end

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
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ElixirPhoenixDemoWeb.Telemetry
    end
  end
end

defmodule HTTPingWeb.Router do
  use HTTPingWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug Phoenix.LiveView.Flash
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", HTTPingWeb do
    pipe_through :browser
    live "/", PingLive
    live "/:url", PingLive
  end
end

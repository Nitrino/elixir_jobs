defmodule ElixirJobsWeb.Router do
  use ElixirJobsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixirJobsWeb do
    pipe_through :browser

    get "/", OfferController, :index

    get "/about", PageController, :about

    resources "/offers", OfferController
    resources "/events", EventController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirJobsWeb do
  #   pipe_through :api
  # end
end

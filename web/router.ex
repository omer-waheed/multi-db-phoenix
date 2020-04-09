defmodule Multi.Router do
  use Multi.Web, :router
  
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

  scope "/", Multi do
    pipe_through :browser # Use the default browser stack
    get "/user_info/:id", SettingController, :fetch
    get "/", PageController, :index
    resources "/posts", PostController
    resources "/settings", SettingController
    resources "/customers", CustomerController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Multi do
  #   pipe_through :api
  # end
end

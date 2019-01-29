defmodule PlateSlateWeb.Router do
  use PlateSlateWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PlateSlateWeb do
    pipe_through :api

    forward "/api", Absinthe.Plug,
      schema: PlateSlateWeb.Schema
  end

  scope "/" do
    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: PlateSlateWeb.Schema,
      interface: :simple
  end
end

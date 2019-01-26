defmodule SiteInspectionServerWeb.Router do
  use SiteInspectionServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: SiteInspectionServerWeb.Graphql.Schema

    forward "/", Absinthe.Plug,
      schema: SiteInspectionServerWeb.Graphql.Schema
  end

  # Other scopes may use custom stacks.
  # scope "/api", SiteInspectionServerWeb do
  #   pipe_through :api
  # end
end

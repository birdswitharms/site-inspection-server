defmodule SiteInspectionServerWeb.Router do
  use SiteInspectionServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug,
      schema: SiteInspectionServerWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: SiteInspectionServerWeb.Schema,
      interface: :simple,
      context: %{pubsub: SiteInspectionServerWeb.Endpoint}
  end

  # Other scopes may use custom stacks.
  # scope "/api", SiteInspectionServerWeb do
  #   pipe_through :api
  # end
end

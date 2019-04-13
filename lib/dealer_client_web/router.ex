defmodule DealerClientWeb.Router do
  use DealerClientWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug,
      schema: DealerClientWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: DealerClientWeb.Schema,
      interface: :simple
  end

end

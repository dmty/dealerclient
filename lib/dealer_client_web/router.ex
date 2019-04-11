defmodule DealerClientWeb.Router do
  use DealerClientWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DealerClientWeb do
    pipe_through :api
  end

  forward "/graphql",
          Absinthe.Plug,
          schema: DealerClientWeb.Schema

  forward "/graphiql",
          Absinthe.Plug.GraphiQL,
          schema: DealerClientWeb.Schema,
          interface: :simple
end

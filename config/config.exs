# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :dealer_client, DealerClientWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nuWHd113VcoKqMJMui1VKNrrdzxQFN4Ono8MBInnTxY8EfgkRfCab+WJkI/MoxcS",
  render_errors: [view: DealerClientWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: DealerClient.PubSub,
           adapter: Phoenix.PubSub.PG2],
  ticket: "137F45B154E3466D8CE52B93387ADB3B7B626C25A1D0496E86C3A9D34263C368",
  wsdl_url: "http://api.dealerbase.co.nz/ServiceVehicleSelect.asmx?WSDL"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configures SOAP
config :soap, :globals, version: "1.2"

defmodule DealerClientWeb.Vehicles do
  import Soap

  @wsdl_url Application.get_env(:dealer_client, DealerClientWeb.Endpoint)[:wsdl_url]
  @ticket Application.get_env(:dealer_client, DealerClientWeb.Endpoint)[:ticket]

  # Stubbed out for now.
  def find_vehicle(id) do
    %{
      name: "Stub vehicle",
      id: id
    }
  end

  def list_all(page_size) do
    params=%{vehicleQueryProxy: %{
      PageSize: page_size,
      ManufacturerNameLike: "BMW" # for quick and min result
    }}

    @wsdl_url
    |> init_model(:url)
    |> elem(1)
    |> call(
         "GetVehicleCollection",
         {
           %{Ticket: @ticket},
           params
         }
       )
    |> elem(1)
    |> Soap.Response.parse
    |> get_in([:GetVehicleCollectionResponse, :GetVehicleCollectionResult, :Vehicles])
    |> Enum.map(fn ({:Vehicles, v}) -> Map.get(v, :Vehicle) end)
  end
end
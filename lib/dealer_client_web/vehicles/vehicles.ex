defmodule DealerClientWeb.Vehicles do
  import Soap

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

    wsdl_path="http://api.dealerbase.co.nz/ServiceVehicleSelect.asmx?WSDL"

    wsdl_path
    |> init_model(:url)
    |> elem(1)
    |> call(
         "GetVehicleCollection",
         {
           %{Ticket: "137F45B154E3466D8CE52B93387ADB3B7B626C25A1D0496E86C3A9D34263C368"},
           params
         }
       )
    |> elem(1)
    |> Soap.Response.parse
    |> get_in([:GetVehicleCollectionResponse, :GetVehicleCollectionResult, :Vehicles])
    |> Enum.map(fn ({:Vehicles, v}) -> Map.get(v, :Vehicle) end)
  end
end
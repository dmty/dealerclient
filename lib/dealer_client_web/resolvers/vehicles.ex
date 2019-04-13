defmodule DealerClientWeb.Resolvers.Vehicles do
  def find_vehicle(_parent, %{id: id}, _resolution) do
    case DealerClientWeb.Vehicles.find_vehicle(id) do
      nil ->
        {:error, "Vehicle ID #{id} not found"}
      vehicle ->
        {:ok, vehicle}
    end
  end
end
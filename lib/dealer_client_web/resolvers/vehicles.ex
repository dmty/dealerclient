defmodule DealerClientWeb.Resolvers.Vehicles do
  def find_vehicle(_parent, %{id: id}, _resolution) do
    case DealerClientWeb.Vehicles.find_vehicle(id) do
      nil -> {:error, "Vehicle ID #{id} not found"}
      vehicle -> {:ok, vehicle}
    end
  end

  def list_all(_parent, %{page_size: page_size}, _resolution) do
    case DealerClientWeb.Vehicles.list_all(page_size) do
      nil -> {:error, "No vehicles found"}
      vehicles -> {:ok, vehicles}
    end
  end
end
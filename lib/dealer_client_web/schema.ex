defmodule DealerClientWeb.Schema do
  use Absinthe.Schema
  import_types Absinthe.Type.Custom
  import_types DealerClientWeb.Schema.VehicleTypes
  alias DealerClientWeb.Resolvers

  query do
    @desc "Get a vehicle"
    field :vehicle, :vehicle do
      arg :id, non_null(:id)
      resolve &Resolvers.Vehicles.find_vehicle/3
    end

    @desc "List of all vehicles"
    field :vehicles, list_of(:vehicle) do
      arg :page_size, :integer
      resolve &Resolvers.Vehicles.list_all/3
    end
  end
end

defmodule DealerClientWeb.Schema.VehicleTypes do
  use Absinthe.Schema.Notation

  @desc "A vehicle"
  object :vehicle do
    field :id, :id
    field :name, :string
  end
end
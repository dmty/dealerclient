defmodule DealerClientWeb.Schema.VehicleTypes do
  use Absinthe.Schema.Notation

  @desc "A vehicle"
  object :vehicle do
    field :id, :id do
      resolve fn parent, _, _ ->
        {:ok, parent[:Id]}
      end
    end
    field :model_name, :string do
      resolve fn parent, _, _ ->
        {:ok, parent[:ModelName]}
      end
    end
    field :manufacturer_name, :string do
      resolve fn parent, _, _ ->
        {:ok, parent[:ManufacturerName]}
      end
    end
    field :year, :string do
      resolve fn parent, _, _ ->
        {:ok, parent[:Year]}
      end
    end
  end
end
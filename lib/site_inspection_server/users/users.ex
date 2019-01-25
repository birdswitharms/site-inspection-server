defmodule SiteInspectionServer.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias SiteInspectionServer.Checklist

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string
    has_many :checklists, Checklist
  end

  def changeset(%__MODULE__{} = user, params \\ %{}) do
    user
    |> cast(params, [:name, :email, :password])
    |> cast_assoc(:checklists)
    |> validate_required([:name, :email, :password])
  end
end

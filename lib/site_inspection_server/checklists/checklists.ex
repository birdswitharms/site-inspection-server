defmodule SiteInspectionServer.Checklist do
  use Ecto.Schema

  import Ecto.Changeset

  alias SiteInspectionServer.User

  schema "checklists" do
    belongs_to :user, User
    field :name, :string
  end

  def changeset(%__MODULE__{} = checklist, params \\ %{}) do
    checklist
    |> cast(params, [:name, :user_id])
    |> cast_assoc(:user)
    |> validate_required([:name])
  end
end

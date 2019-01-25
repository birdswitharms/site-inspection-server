defmodule SiteInspectionServer.Checklist do
  use Ecto.Schema

  import Ecto.Changeset

  alias SiteInspectionServer.{User, Project}

  schema "checklists" do
    belongs_to :user, User
    belongs_to :project, Project
    field :name, :string
  end

  def changeset(%__MODULE__{} = checklist, params \\ %{}) do
    checklist
    |> cast(params, [:name, :user_id, :project_id])
    |> cast_assoc(:user)
    |> cast_assoc(:project)
    |> validate_required([:name])
  end
end

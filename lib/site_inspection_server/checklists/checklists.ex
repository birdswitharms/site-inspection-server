defmodule SiteInspectionServer.Checklist do
  use Ecto.Schema

  import Ecto.Changeset

  alias SiteInspectionServer.{User, Project, Task}

  schema "checklists" do
    belongs_to :user, User
    belongs_to :project, Project
    has_many :tasks, Task
    field :name, :string
  end

  def changeset(%__MODULE__{} = checklist, params \\ %{}) do
    checklist
    |> cast(params, [:name, :user_id, :project_id])
    |> cast_assoc(:user)
    |> cast_assoc(:project)
    |> cast_assoc(:tasks)
    |> validate_required([:name])
    |> assoc_constraint(:user)
    |> assoc_constraint(:project)
  end
end

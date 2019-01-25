defmodule SiteInspectionServer.Project do
  use Ecto.Schema

  import Ecto.Changeset

  schema "projects" do
    field :name, :string
    field :job_number, :string
    field :address, :string
    field :gc_company, :string
    field :permit_number, :string
  end

  def changeset(%__MODULE__{} = projects, params \\ %{}) do
    projects
    |> cast(params, [:name, :job_number, :address, :gc_company, :permit_number])
    |> validate_required([:name, :job_number])
  end
end

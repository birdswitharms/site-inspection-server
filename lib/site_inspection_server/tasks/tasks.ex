defmodule SiteInspectionServer.Task do
  use Ecto.Schema

  import Ecto.Changeset

  alias SiteInspectionServer.Checklist

  schema "tasks" do
    field :description, :string
    field :completed, :boolean
    belongs_to :checklist, Checklist
  end

  def changeset(%__MODULE__{} = task, params \\ %{}) do
    task
    |> cast(params, [:description, :completed, :checklist_id])
    |> validate_required([:description])
  end
end

defmodule SiteInspectionServer.Repo.Migrations.AddTasksTable do
  use Ecto.Migration

  def change do
    create table :tasks do
      add :description, :string
      add :percent_complete, :integer, default: 0
      add :completed, :boolean, default: false
      add :checklist_id, references(:checklists)
      add :image_id, :string
      add :notes, :text
    end
  end
end

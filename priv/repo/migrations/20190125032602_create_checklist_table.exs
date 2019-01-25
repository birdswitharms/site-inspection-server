defmodule SiteInspectionServer.Repo.Migrations.CreateChecklistTable do
  use Ecto.Migration

  def change do
    create table :checklists do
      add :user, references(:users)
      add :name, :string
    end
  end
end

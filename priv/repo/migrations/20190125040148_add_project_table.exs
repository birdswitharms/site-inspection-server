defmodule SiteInspectionServer.Repo.Migrations.AddProjectTable do
  use Ecto.Migration

  def change do
    create table :projects do
      add :name, :string
      add :job_number, :string
      add :address, :string
      add :gc_company, :string
      add :permit_number, :string
    end

    alter table :checklists do
      add :project_id, references(:projects)
    end
  end
end

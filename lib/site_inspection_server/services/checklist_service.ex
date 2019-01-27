defmodule SiteInspectionServer.Services.ChecklistServices do
  alias SiteInspectionServer.{Checklist, Repo}

  def all_checklists() do
    Repo.all(Checklist)
  end

  def get_checklist_with_id(id) do
    Repo.get_by(Checklist, id: id)
  end

  def get_user_with_checklist(checklist) do
    checklist
    |> Repo.preload(:user)
    |> Map.get(:user)
  end

  def get_project_with_checklist(checklist) do
    checklist
    |> Repo.preload(:project)
    |> Map.get(:project)
  end

  def get_all_tasks_with_checklist(checklist) do
    checklist
    |> Repo.preload(:tasks)
    |> Map.get(:tasks)
  end

  def get_all_checklists_with_project(project) do
    project
    |> Repo.preload(:checklists)
    |> Map.get(:checklists)
  end

end

defmodule SiteInspectionServer.Services.ProjectServices do
  alias SiteInspectionServer.{Project, Repo}

  def get_project_with_id(id) do
    Repo.get_by(Project, id: id)
  end

  def get_project_with_checklist(checklist) do
    checklist
    |> Repo.preload(:project)
    |> Map.get(:project)
  end
end

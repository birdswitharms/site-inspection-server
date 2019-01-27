defmodule SiteInspectionServerWeb.Graphql.ProjectResolver do
  alias SiteInspectionServer.Services.ProjectServices

  def all_projects(_root, _args, _info) do
    projects = ProjectServices.all_projects()
    {:ok, projects}
  end

  def find_project_by_id(id, _context) do
    project = ProjectServices.get_project_with_id(id)
    {:ok, project}
  end

  def find_project_by_id(_root, %{id: id}, _info) do
    project = ProjectServices.get_project_with_id(id)
    {:ok, project}
  end

  def get_project_with_checklist(checklist, _params, _absinthe_context) do
    project = ProjectServices.get_project_with_checklist(checklist)
    {:ok, project}
  end
end

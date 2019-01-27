defmodule SiteInspectionServerWeb.Graphql.ChecklistResolver do
  alias SiteInspectionServer.Services.ChecklistServices

  def all_checklists(_root, _args, _info) do
    checklists = ChecklistServices.all_checklists()
    {:ok, checklists}
  end

  def find_checklist_by_id(id, _context) do
    checklist = ChecklistServices.get_checklist_with_id(id)
    {:ok, checklist}
  end

  def find_checklist_by_id(_root, %{id: id}, _info) do
    checklist = ChecklistServices.get_checklist_with_id(id)
    {:ok, checklist}
  end

  def get_user_with_checklist(checklist, _params, _absinthe_context) do
    user = ChecklistServices.get_user_with_checklist(checklist)
    {:ok, user}
  end

  def get_all_tasks_with_checklist(checklist, _params, _absinthe_context) do
    tasks = ChecklistServices.get_all_tasks_with_checklist(checklist)
    {:ok, tasks}
  end

  def get_project_with_checklist(checklist, _params, _absinthe_context) do
    project = ChecklistServices.get_project_with_checklist(checklist)
    {:ok, project}
  end

  def get_all_checklists_with_project(project, _params, _absinthe_context) do
    checklists = ChecklistServices.get_all_checklists_with_project(project)
    {:ok, checklists}
  end
end

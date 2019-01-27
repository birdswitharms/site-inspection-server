defmodule SiteInspectionServerWeb.Graphql.TaskResolver do
  alias SiteInspectionServer.Services.TaskServices

  def all_tasks(_root, _args, _info) do
    tasks = TaskServices.all_tasks()
    {:ok, tasks}
  end

  def find_task_by_id(id, _context) do
    task = TaskServices.get_task_with_id(id)
    {:ok, task}
  end

  def find_task_by_id(_root, %{id: id}, _info) do
    task = TaskServices.get_task_with_id(id)
    {:ok, task}
  end

  def get_checklist_with_task(task, _params, _absinthe_context) do
    checklist = TaskServices.get_checklist_with_task(task)
    {:ok, checklist}
  end
end

defmodule SiteInspectionServer.Services.TaskServices do
  alias SiteInspectionServer.{Task, Repo}

  def get_task_with_id(id) do
    Repo.get_by(Task, id: id)
  end

  def all_tasks() do
    Repo.all(Task)
  end

  def get_checklist_with_task(task) do
    task
    |> Repo.preload(:checklist)
    |> Map.get(:checklist)
  end
end

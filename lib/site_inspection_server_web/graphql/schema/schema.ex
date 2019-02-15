defmodule SiteInspectionServerWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  alias SiteInspectionServer.{Task, Project, User, Checklist}
  alias SiteInspectionServerWeb.Graphql.{
    TaskResolver,
    ProjectResolver,
    TaskResolver,
    ChecklistResolver,
    UserResolver
  }

  import_types Absinthe.Type.Custom

  import_types SiteInspectionServerWeb.Schema.Types

  query do
    node field do
      resolve fn
        %{type: :task, id: id}, absinthe_context ->
          TaskResolver.find_task_by_id(String.to_integer(id), absinthe_context)
        %{type: :user, id: id}, absinthe_context ->
          UserResolver.find_user_by_id(String.to_integer(id), absinthe_context)
        %{type: :project, id: id}, absinthe_context ->
          ProjectResolver.find_project_by_id(String.to_integer(id), absinthe_context)
        %{type: :checklist, id: id}, absinthe_context ->
          ChecklistResolver.find_checklist_by_id(String.to_integer(id), absinthe_context)
      end
    end

    field :all_checklists, list_of(:checklist) do
      resolve &ChecklistResolver.all_checklists/3
    end
    field :all_tasks, list_of(:task) do
      resolve &TaskResolver.all_tasks/3
    end
    field :all_projects, list_of(:project) do
      resolve &ProjectResolver.all_projects/3
    end
    field :all_users, list_of(:user) do
      resolve &UserResolver.all_users/3
    end
  end

  node interface do
    resolve_type fn
      %Project{}, _ ->
        :project
      %User{}, _ ->
        :user
      %Task{}, _ ->
        :task
      %Checklist{}, _ ->
        :checklist
      _, _ ->
        nil
    end
  end
end

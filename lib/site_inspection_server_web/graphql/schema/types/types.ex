defmodule SiteInspectionServerWeb.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation

  alias SiteInspectionServerWeb.Graphql.{TaskResolver, ChecklistResolver, UserResolver, ProjectResolver}

  node object :task do
    field :description, :string
    field :completed, :boolean
    field :checklist, :checklist do
      resolve &TaskResolver.get_checklist_with_task/3
    end
  end

  node object :checklist do
    field :user, :user do
      resolve &ChecklistResolver.get_user_with_checklist/3
    end
    field :project, :project do
      resolve &ProjectResolver.get_project_with_checklist/3
    end
    field :task, list_of(:task) do
      resolve &ChecklistResolver.get_all_tasks_with_checklist/3
    end
    field :name, :string
  end

  node object :project do
    field :name, :string
    field :job_number, :string
    field :address, :string
    field :gc_company, :string
    field :permit_number, :string
    field :checklists, list_of(:checklist) do
      resolve &ChecklistResolver.get_all_checklists_with_project/3
    end
  end

  node object :user do
    field :name, :string
    field :email, :string
    field :password, :string
    field :checklists, list_of(:checklist) do
      resolve &UserResolver.get_checklists_with_user/3
    end
  end
end

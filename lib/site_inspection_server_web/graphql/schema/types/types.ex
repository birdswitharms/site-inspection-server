defmodule SiteInspectionServerWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias SiteInspectionServerWeb.Graphql.{TaskResolver, ChecklistResolver, UserResolver, ProjectResolver}

  object :task do
    field :id, :id
    field :description, :string
    field :percent_complete, :integer
    field :completed, :boolean
    field :checklist, :checklist do
      resolve &TaskResolver.get_checklist_with_task/3
    end
  end

  object :checklist do
    field :id, :id
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

  object :project do
    field :id, :id
    field :name, :string
    field :job_number, :string
    field :address, :string
    field :gc_company, :string
    field :permit_number, :string
    field :checklists, list_of(:checklist) do
      resolve &ChecklistResolver.get_all_checklists_with_project/3
    end
  end

  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
    field :password, :string
    field :checklists, list_of(:checklist) do
      resolve &UserResolver.get_checklists_with_user/3
    end
  end
end

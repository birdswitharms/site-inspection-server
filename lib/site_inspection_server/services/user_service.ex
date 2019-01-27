defmodule SiteInspectionServer.Services.UserServices do
  alias SiteInspectionServer.{Repo, User}

  def get_user_with_id(id) do
    Repo.get_by(User, id: id)
  end

  def all_users() do
    Repo.all(User)
  end

  def get_checklists_with_user(user) do
    user
    |> Repo.preload(:checklists)
    |> Map.get(:checklists)
  end
end

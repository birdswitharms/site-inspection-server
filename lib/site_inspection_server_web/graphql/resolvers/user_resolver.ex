defmodule SiteInspectionServerWeb.Graphql.UserResolver do
  alias SiteInspectionServer.Services.UserServices

  def find_user_by_id(id, _context) do
    user = UserServices.get_user_with_id(id)
    {:ok, user}
  end

  def find_user_by_id(_root, %{id: id}, _info) do
    user = UserServices.get_user_with_id(id)
    {:ok, user}
  end

  def get_checklists_with_user(user, _params, _absinthe_context) do
    checklists = UserServices.get_checklists_with_user(user)
    {:ok, checklists}
  end
end

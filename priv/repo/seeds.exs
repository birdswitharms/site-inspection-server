# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SiteInspectionServer.Repo.insert!(%SiteInspectionServer.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias SiteInspectionServer.{User, Checklist, Repo, Project, Task}

{:ok, user} = User.changeset(%User{}, %{name: "Andrew Segal", email: "segal.a@hotmail.com", password: "123"}) |> Repo.insert

{:ok, project} = Project.changeset(%Project{}, %{name: "first project", job_number: "1000", address: "11 Dunbloor", gc_company: "Company name here", permit_number: "1000"}) |> Repo.insert

{:ok, checklist} = Checklist.changeset(%Checklist{}, %{name: "first checklist", project_id: project.id, user_id: user.id}) |> Repo.insert

Task.changeset(%Task{}, %{description: "Clean ducts", percent_complete: 50, checklist_id: checklist.id}) |> Repo.insert

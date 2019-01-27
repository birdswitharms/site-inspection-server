alias SiteInspectionServer.{User, Checklist, Repo, Project, Task}

projects = [
  %{name: "Humber", job_number: "1921", address: "10 Humber Street", gc_company: "Bird Construction", permit_number: "19 12345"},
  %{name: "Carrot", job_number: "1281", address: "100 Lombard Street", gc_company: "Ellis Don", permit_number: "19 54321"},
  %{name: "Glass", job_number: "1251", address: "7220 West Credit Ave", gc_company: "Bering Mechanical", permit_number: "19 22445"},
  %{name: "Serrano", job_number: "1811", address: "11 Dunbloor", gc_company: "Bird Construction", permit_number: "19 12345"},
  %{name: "Carrot", job_number: "1281", address: "100 Lombard Street", gc_company: "Ellis Don", permit_number: "19 54321"},
  %{name: "Glass", job_number: "1251", address: "7220 West Credit Ave", gc_company: "Bering Mechanical", permit_number: "19 22445"}
]

users = [
  %{name: "Andrew", email: "andrew@email.com", password: "12345"},
  %{name: "Melanie", email: "melanie@email.com", password: "12345"},
  %{name: "David", email: "david@email.com", password: "12345"},
  %{name: "Randy", email: "randy@email.com", password: "12345"},
]

checklists = [
  %{name: "0 Percent Inspection", project_id: 0, user_id: 0},
  %{name: "25 Percent Inspection", project_id: 0, user_id: 0},
  %{name: "50 Percent Inspection", project_id: 0, user_id: 0},
  %{name: "75 Percent Inspection", project_id: 0, user_id: 0},
  %{name: "100 Percent Inspection", project_id: 0, user_id: 0}
]

Enum.each(users, fn user -> (
  User.changeset(%User{}, user) |> Repo.insert!()
) end)

Enum.each(projects, fn project -> (
  Project.changeset(%Project{}, project) |> Repo.insert!()

) end)

Enum.each(checklists, fn checklist -> (
  user  = Repo.all(User) |> Enum.take_random(1) |> List.first()
  project  = Repo.all(Project) |> Enum.take_random(1) |> List.first()
  Checklist.changeset(
    %Checklist{}, %{checklist | project_id: project.id, user_id: user.id}
    )
    |> Repo.insert!()
) end)

tasks = [
  %{description: "Clean ducts", checklist_id: 0},
  %{description: "Check stormc drain installation", checklist_id: 0},
  %{description: "Check gas pipe installation", checklist_id: 0},
  %{description: "Check domestic water installation", checklist_id: 0},
]

Enum.each(tasks, fn task -> (
  checklist  = Repo.all(Checklist) |> Enum.take_random(1) |> List.first()
  Task.changeset(%Task{}, %{task | checklist_id: checklist.id}) |> Repo.insert!()
) end)

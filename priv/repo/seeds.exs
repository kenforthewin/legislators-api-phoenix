# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
alias App.Repo
alias App.Legislator

Repo.delete_all Legislator

path = File.cwd! |> Path.join("congress-legislators/legislators-current.yaml")
yaml = YamlElixir.read_from_file path

yaml |> Enum.each(&(Repo.insert! %Legislator{
  first_name: &1["name"]["first"],
  middle_name: &1["name"]["middle"],
  last_name: &1["name"]["last"],
  official_name: &1["name"]["official_full"],
  birthday: &1["bio"]["birthday"],
  thomas_id: &1["id"]["thomas"]
}))
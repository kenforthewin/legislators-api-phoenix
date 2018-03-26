defmodule App.Repo.Migrations.CreateLegislators do
  use Ecto.Migration

  def change do
    create table(:legislators) do
      add :first_name, :string
      add :middle_name, :string
      add :last_name, :string
      add :official_name, :string
      add :birthday, :string
      add :gender, :string
      add :twitter, :string
      add :youtube, :string
      add :instagram, :string
      add :facebook, :string
      add :wikipedia, :string
      add :thomas_id, :string

      timestamps()
    end

  end
end

defmodule App.Legislator do
  use Ecto.Schema
  import Ecto.Changeset


  schema "legislators" do
    field :birthday, :string
    field :facebook, :string
    field :first_name, :string
    field :gender, :string
    field :instagram, :string
    field :last_name, :string
    field :middle_name, :string
    field :official_name, :string
    field :thomas_id, :string
    field :twitter, :string
    field :wikipedia, :string
    field :youtube, :string

    timestamps()
  end

  @doc false
  def changeset(legislator, attrs) do
    legislator
    |> cast(attrs, [:first_name, :middle_name, :last_name, :official_name, :birthday, :gender, :twitter, :youtube, :instagram, :facebook, :wikipedia, :thomas_id])
    |> validate_required([:first_name, :middle_name, :last_name, :official_name, :birthday, :gender, :twitter, :youtube, :instagram, :facebook, :wikipedia, :thomas_id])
  end
end

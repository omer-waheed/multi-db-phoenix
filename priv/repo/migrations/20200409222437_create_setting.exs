defmodule Multi.Repo.Migrations.CreateSetting do
  use Ecto.Migration

  def change do
    create table(:settings) do
      add :name, :string
      add :user, :integer

      timestamps()
    end

  end
end

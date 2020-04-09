defmodule Multi.Repo.Migrations.CreateCustomer do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :cinc, :string
      add :user, :integer

      timestamps()
    end

  end
end

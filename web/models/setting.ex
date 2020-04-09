defmodule Multi.Setting do
  use Multi.Web, :model

  schema "settings" do
    field :name, :string
    field :user, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :user])
    |> validate_required([:name, :user])
  end
end

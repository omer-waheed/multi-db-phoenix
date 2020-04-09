defmodule Multi.Customer do
  use Multi.Web, :model

  schema "customers" do
    field :cinc, :string
    field :user, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:cinc, :user])
    |> validate_required([:cinc, :user])
  end
end

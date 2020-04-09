defmodule Multi.CustomerTest do
  use Multi.ModelCase

  alias Multi.Customer

  @valid_attrs %{cinc: "some content", user: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Customer.changeset(%Customer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Customer.changeset(%Customer{}, @invalid_attrs)
    refute changeset.valid?
  end
end

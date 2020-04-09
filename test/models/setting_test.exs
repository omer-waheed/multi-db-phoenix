defmodule Multi.SettingTest do
  use Multi.ModelCase

  alias Multi.Setting

  @valid_attrs %{name: "some content", user: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Setting.changeset(%Setting{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Setting.changeset(%Setting{}, @invalid_attrs)
    refute changeset.valid?
  end
end

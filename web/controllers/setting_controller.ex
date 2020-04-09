defmodule Multi.SettingController do
  use Multi.Web, :controller

  alias Multi.Setting
  alias Multi.Second
  alias Multi.Customer

  def fetch(conn, %{"id" => id}) do
    try do
      setting = Repo.get_by(Setting, user: id)
      customer = Second.get_by(Customer, user: id)
      json(conn, %{user: setting.id, name: setting.name,cnic: customer.cinc})
    rescue e in UndefinedFunctionError -> e
      json(conn, %{error: "NO USER FOUND"})
    end
  end

end

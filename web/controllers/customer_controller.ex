defmodule Multi.CustomerController do
  use Multi.Web, :controller

  alias Multi.Customer
  alias Multi.Second
  def index(conn, _params) do
    customers = Second.all(Customer)
    render(conn, "index.html", customers: customers)
  end

  def new(conn, _params) do
    changeset = Customer.changeset(%Customer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"customer" => customer_params}) do
    changeset = Customer.changeset(%Customer{}, customer_params)

    case Second.insert(changeset) do
      {:ok, _customer} ->
        conn
        |> put_flash(:info, "Customer created successfully.")
        |> redirect(to: customer_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    customer = Second.get!(Customer, id)
    render(conn, "show.html", customer: customer)
  end

  def edit(conn, %{"id" => id}) do
    customer = Second.get!(Customer, id)
    changeset = Customer.changeset(customer)
    render(conn, "edit.html", customer: customer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "customer" => customer_params}) do
    customer = Second.get!(Customer, id)
    changeset = Customer.changeset(customer, customer_params)

    case Second.update(changeset) do
      {:ok, customer} ->
        conn
        |> put_flash(:info, "Customer updated successfully.")
        |> redirect(to: customer_path(conn, :show, customer))
      {:error, changeset} ->
        render(conn, "edit.html", customer: customer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    customer = Second.get!(Customer, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Second.delete!(customer)

    conn
    |> put_flash(:info, "Customer deleted successfully.")
    |> redirect(to: customer_path(conn, :index))
  end
end

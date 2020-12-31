defmodule ElixirPhoenixDemoWeb.PageController do
  use ElixirPhoenixDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def redirect_internal(conn, _params) do
    conn
    |> put_flash(:info, "You have been redirected, from flash info!")
    |> put_flash(:error, "this is a redirect test.")
    |> redirect(to: Routes.page_path(conn, :redirect_test))
  end

  def redirect_external(conn, _params) do
    redirect(conn, external: "https://elixir-lang.org/")
  end

  def redirect_test(conn, _params) do
    render(conn, "redirect.html")
  end
end

defmodule ElixirPhoenixDemoWeb.PageController do
  use ElixirPhoenixDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

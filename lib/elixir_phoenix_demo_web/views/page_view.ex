defmodule ElixirPhoenixDemoWeb.PageView do
  use ElixirPhoenixDemoWeb, :view

  def render("json_test.json", %{pages: pages}) do
    %{data: render_many(pages, ElixirPhoenixDemoWeb.PageView, "page.json")}
  end

  def render("page.json", %{page: page}) do
    %{
      title: page.title,
      message: page.message
    }
  end
end

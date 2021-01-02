defmodule ElixirPhoenixDemoWeb.CMS.PageView do
  use ElixirPhoenixDemoWeb, :view

  alias ElixirPhoenixDemo.CMS

  def author_name(%CMS.Page{author: author}) do
    author.user.name
  end
end

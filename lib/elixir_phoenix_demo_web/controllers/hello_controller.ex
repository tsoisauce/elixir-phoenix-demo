defmodule ElixirPhoenixDemoWeb.HelloController do
  use ElixirPhoenixDemoWeb, :controller

  def index(conn, _params) do
    conn
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "Let's pretend we have an error.")
    |> put_layout("admin.html")
    |> render(:index) # converting to atom allows alternative formats with the same controller view name http://localhost:4000/hello?_format=text
  end

  def show(conn, %{"messenger" => messenger} = params) do
    # the following are different types of responses attached to a controller
    render(conn, "show.html", %{messenger: messenger, message: "testing message"})
    # text(conn, "From messenger #{messenger}")
    # json(conn, %{id: messenger})
    # html(conn, """
    #   <html>
    #     <head>
    #         <title>Passing a Messenger</title>
    #     </head>
    #     <body>
    #       <p>From messenger #{Plug.HTML.html_escape(messenger)}</p>
    #     </body>
    #   </html>
    # """)
  end
end
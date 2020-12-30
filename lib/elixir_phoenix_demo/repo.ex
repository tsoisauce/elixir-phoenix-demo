defmodule ElixirPhoenixDemo.Repo do
  use Ecto.Repo,
    otp_app: :elixir_phoenix_demo,
    adapter: Ecto.Adapters.Postgres
end

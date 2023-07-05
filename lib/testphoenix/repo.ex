defmodule Testphoenix.Repo do
  use Ecto.Repo,
    otp_app: :testphoenix,
    adapter: Ecto.Adapters.Postgres
end

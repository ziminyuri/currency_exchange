defmodule Currency.Repo do
  use Ecto.Repo,
    otp_app: :currency,
    adapter: Ecto.Adapters.Postgres
end

defmodule ElixirJobs.Repo do
  use Ecto.Repo,
    otp_app: :elixir_jobs,
    adapter: Ecto.Adapters.Postgres
  use Scrivener, page_size: 10
end

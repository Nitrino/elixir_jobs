# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixir_jobs,
  ecto_repos: [ElixirJobs.Repo]

# Configures the endpoint
config :elixir_jobs, ElixirJobsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ccqvr7dRjPVgLb4To1KxW4mBi3OjmtMX6R4nbeBMm0jAoVXdmfpMxSDvKFvvQYyC",
  render_errors: [view: ElixirJobsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirJobs.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :scrivener_html,
  routes_helper: MyApp.Router.Helpers

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

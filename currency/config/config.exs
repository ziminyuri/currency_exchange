# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :currency,
  ecto_repos: [Currency.Repo]

# Configures the endpoint
config :currency, CurrencyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oysC4JFl2Um/Q4xVqC0DjPOCinNpGSWHTfJ7CKrOk2n9pMbaEpWuFC5uHTfJyFdv",
  render_errors: [view: CurrencyWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Currency.PubSub,
  live_view: [signing_salt: "aSmZ/m4V"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

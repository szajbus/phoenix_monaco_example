# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
config :monaco_example, MonacoExampleWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [html: MonacoExampleWeb.ErrorHTML, json: MonacoExampleWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: MonacoExample.PubSub,
  live_view: [signing_salt: "BpNsc9wh"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.41",
  default: [
    args: ~w(
        js/app.js
        --bundle
        --target=es2017
        --outdir=../priv/static/assets
        --external:/fonts/*
        --external:/images/*
        --loader:.ttf=file
      ),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ],
  monaco_editor: [
    args: ~w(
        node_modules/monaco-editor/esm/vs/editor/editor.worker.js
        node_modules/monaco-editor/esm/vs/language/css/css.worker.js
        node_modules/monaco-editor/esm/vs/language/html/html.worker.js
        node_modules/monaco-editor/esm/vs/language/json/json.worker.js
        node_modules/monaco-editor/esm/vs/language/typescript/ts.worker.js
        --bundle
        --target=es2017
        --outdir=../priv/static/assets/monaco-editor
      ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.2.4",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/style.css
      --output=../priv/static/assets/style.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

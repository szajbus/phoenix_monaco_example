import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :monaco_example, MonacoExampleWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "7FdhQg3peSWjQXWbGQNBEKURBkN1/f4TFg1+nDudPcP14nnRIzcuNm2WVCSAXaWi",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

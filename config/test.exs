import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :canvas,
  canvas_max_width: 5,
  canvas_max_height: 5

config :canvas, Canvas.Repo,
  username: "postgres",
  password: "postgres",
  database: "canvas_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :canvas, CanvasWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "9ztLhSliP5DDcjeZlm10Zb/BvlRE3hxPeBTHiDsmCzWgasrqjVfRtNGPM774AleD",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

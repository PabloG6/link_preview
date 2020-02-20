use Mix.Config

config :httparrot,
  http_port: 8888,
  https_port: 8484,
  ssl: true,
  unix_socket: false

config :tesla, adapter: Tesla.Adapter.Hackney

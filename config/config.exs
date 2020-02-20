use Mix.Config


config :floki, :html_parser, Floki.HTMLParser.Html5ever
config :tesla, adapter: Tesla.Adapter.Hackney


if File.exists?("config/#{Mix.env()}.exs") do
  IO.puts "exists"
  IO.puts "#{Mix.env()}.exs"
  import_config "#{Mix.env()}.exs"
end

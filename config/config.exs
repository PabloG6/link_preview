use Mix.Config


config :floki, :fast_html, Floki.HTMLParser.FastHtml
config :tesla, adapter: Tesla.Adapter.Hackney


if File.exists?("config/#{Mix.env()}.exs") do
  IO.puts "exists"
  IO.puts "#{Mix.env()}.exs"
  import_config "#{Mix.env()}.exs"
end

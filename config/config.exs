use Mix.Config

if File.exists?("config/#{Mix.env()}.exs") do
  import_config "#{Mix.env()}.exs"
end

config :floki, :html_parser, Floki.HTMLParser.Html5ever

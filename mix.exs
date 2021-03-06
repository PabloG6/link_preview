defmodule LinkPreview.Mixfile do
  use Mix.Project

  @version "1.0.3"

  def project do
    [
      aliases: aliases(),
      app: :link_preview,
      deps: deps(),
      description: description(),
      docs: [
        extras: ["README.md", "CHANGELOG.md"]
      ],
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env()),
      homepage_url: "https://appunite.com",
      name: "Link Preview",
      package: package(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.travis": :test
      ],
      source_url: "https://github.com/appunite/link_preview",
      test_coverage: [
        tool: ExCoveralls
      ],
      version: @version
    ]
  end

  defp description do
    """
    LinkPreview is a package that tries to receive meta information from given http(s) address.
    Generated page struct includes website title, description, images and more.
    """
  end

  defp package do
    [
      files: ["lib", "config", "mix.exs", "README.md", "CHANGELOG.md"],
      maintainers: ["Tobiasz Małecki", "Karol Wojtaszek"],
      licenses: ["Apache 2.0"],
      links: %{
        "GitHub" => "https://github.com/appunite/link_preview",
        "Sponsor" => "https://appunite.com"
      }
    ]
  end

  def application do
    [applications: applications(Mix.env())]
  end

  def applications(:all), do: [:hackney, :floki, :inets, :logger, :tesla]
  def applications(:test), do: applications(:all) ++ [:httparrot]
  def applications(_), do: applications(:all)

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      # required
      {:floki, "~> 0.21.0"},
      {:tesla, "~> 1.3.2"},
      {:html5ever, git: "https://github.com/PabloG6/html5ever_elixir.git"},

      {:hackney, "~> 1.6"},
      {:jason, ">= 1.0.0"},
      # optional
      {:html_entities, "~> 0.4", optional: true},
      {:mogrify, "~> 0.7.3"},
      {:tempfile, "~> 0.1.0"},

      # testing/docs
      {:excoveralls, "~> 0.6", only: :test},
      {:ex_doc, "~> 0.12", only: :dev},
      {:httparrot, "~> 0.5.0", only: :test},
      {:mock, "~> 0.3.3", only: :test}
    ]
  end

  defp aliases do
    [
      test: ["test --exclude excluded"]
    ]
  end
end

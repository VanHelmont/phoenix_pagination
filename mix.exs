defmodule Phoenix.Pagination.Mixfile do
  use Mix.Project
  @version "1.1.1"

  def project do
    [
      app: :phoenix_pagination,
      version: @version,
      elixir: "~> 1.14",
      elixirc_paths: path(Mix.env()),
      package: package(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      name: "phoenix_pagination",
      docs: [
        main: "readme",
        extras: ["README.md"],
        source_ref: "v#{@version}"
      ],
      source_url: "https://github.com/FunkyStudioHQ/phoenix_pagination.git",
      homepage_url: "https://github.com/FunkyStudioHQ/phoenix_pagination",
      description: """
      Simple pagination for Ecto and Phoenix using plaing EEx templates.
      """
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [extra_applications: application(Mix.env())]
  end

  defp application(:test), do: [:postgrex, :ecto_sql, :logger]
  defp application(_), do: [:plug, :phoenix_html, :ecto, :ecto_sql, :logger]

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:phoenix_html, "~> 4.0"},
      {:phoenix_html_helpers, "~> 1.0"},
      {:plug, "~> 1.14"},
      {:ecto_sql, "~> 3.11"},
      # Test dependencies
      {:postgrex, ">= 0.0.0", only: [:test]},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      # Docs dependencies
      {:earmark, "~> 1.4", only: :dev},
      {:ex_doc, "~> 0.31", only: :dev, runtime: false}
    ]
  end

  defp path(:test) do
    ["lib", "test/support", "test/fixtures"]
  end

  defp path(_), do: ["lib"]

  defp package do
    [
      maintainers: ["FunkyStudio", "VanHelmont"],
      licenses: ["MIT"],
      links: %{
        "Github" => "https://github.com/VanHelmont/phoenix_pagination.git",
        "FunkyStudio" => "http://funky.studio"
      },
      files: ~w(lib test config) ++ ~w(CHANGELOG.md LICENSE.md mix.exs README.md)
    ]
  end

  def aliases do
    [test: ["ecto.migrate --quiet", "test"]]
  end
end

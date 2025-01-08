defmodule HumanToMillis.MixProject do
  use Mix.Project

  def project do
    [
      app: :human_to_millis,
      description: "Converting human-readable time intervals into milliseconds",
      version: "0.1.0",
      elixir: "~> 1.18-dev",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp package do
    [
      name: "human_to_millis",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/cedricPoncot/human_to_millis"},
      maintainers: ["0x9dd"],
      files: ~w(lib mix.exs README*)
    ]
  end
end

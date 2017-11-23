defmodule CAS_Users.Mixfile do
  use Mix.Project

  def project do
    [
      app: :cas_users,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
      mod: {CAS_Users.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:data, path: "../data"}
    ]
  end
end

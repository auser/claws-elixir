defmodule CLAWS.Mixfile do
  use Mix.Project

  #######
  # API #
  #######

  def application() do
    [
      extra_applications: [:logger],
      mod: {CLAWS.Application, []}
    ]
  end

  def project do
    [
      app: :claws,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
    ]
  end

  ###########
  # Private #
  ###########

  defp deps() do
    [
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false}
    ]
  end
end

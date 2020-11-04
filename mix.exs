defmodule BambooSMTPSandbox.MixProject do
  use Mix.Project

  def project do
    [
      app: :bamboo_smtp_sandbox,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :bamboo, :bamboo_smtp],
      mod: {BambooSMTPSandbox.Application, []}
    ]
  end

  defp deps do
    [{:bamboo_smtp, "~> 3.0"}]
  end
end

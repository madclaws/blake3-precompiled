defmodule MixBlake3.Project do
  use Mix.Project

  @source_url "https://github.com/madclaws/blake3-precompiled"
  @version "0.1.2"

  def project do
    [
      app: :blake3_precompiled,
      version: @version,
      elixir: "~> 1.13",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  def application do
    []
  end

  defp package() do
    [
      description: "Elixir binding for the Rust Blake3 implementation",
      files: ["lib", "native", ".formatter.exs", "README*", "LICENSE*", "mix.exs"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp deps do
    [
      {:rustler_precompiled, "~> 0.7.0"},
      {:rustler, "~> 0.30", optional: true},
      {:ex_doc, "~> 0.21", only: [:dev, :test], runtime: false}
    ]
  end

  defp docs do
    [
      extras: ["README.md"],
      main: "readme",
      source_url: @source_url
    ]
  end

  def config_features() do
    simd =
      case Application.get_env(:blake3_precompiled, :simd_mode) || System.get_env("BLAKE3_SIMD_MODE") do
        "c_neon" -> "neon"
        :c_neon -> "neon"
        "neon" -> "neon"
        :neon -> "neon"
        _ -> nil
      end

    rayon =
      if !is_nil(Application.get_env(:blake3_precompiled, :rayon) || System.get_env("BLAKE3_RAYON")) do
        "rayon"
      else
        nil
      end

    Enum.reject([simd, rayon], &is_nil/1)
  end
end

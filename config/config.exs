import Config

config :blake3_precompiled, Blake3Precompiled.Native,
  mode: :release,
  features: Blake3Precompiled.Project.config_features()

import_config("#{Mix.env()}.exs")

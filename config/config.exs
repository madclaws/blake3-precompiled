import Config

config :blake3_precompiled, Blake3Precompiled.Native,
  mode: :release,
  features: Blake3Precompiled.Project.config_features()

config :rustler_precompiled, :force_build, blake3_precompiled: true

import_config("#{Mix.env()}.exs")

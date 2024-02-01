
# Blake3 Precompiled

Trying to produce a precompiled version of the blake3 nif with the
existing [Elixir bindings for the Rust Blake3 implementation](https://github.com/Thomas-Jean/blake3).

## Installation

The package can be installed by adding `blake3_precompiled` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:blake3_precompiled, git: "https://github.com/madclaws/blake3-precompiled.git"}
  ]
end
```

use Mix.Config

if File.exists?(Path.join([__DIR__, "test.secret.exs"])) do
  import_config "test.secret.exs"
end

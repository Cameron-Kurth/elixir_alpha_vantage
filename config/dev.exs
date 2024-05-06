import Config

if File.exists?(Path.join([__DIR__, "dev.secret.exs"])) do
  import_config "dev.secret.exs"
end

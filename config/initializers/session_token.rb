token_file = Rails.root.join('config', 'session_token.yml')
unless File.exists?(token_file)
  File.open(token_file, "w") do |f|
    f.write SecureRandom.hex(128).to_yaml
  end
end

ExampleStore::Application.config.secret_token = YAML.load_file(token_file)

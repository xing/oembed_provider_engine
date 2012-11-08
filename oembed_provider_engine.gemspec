$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "oembed_provider_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "oembed_provider_engine"
  s.version     = OembedProviderEngine::VERSION
  s.authors     = ["Kerstin Puschke", "Hinnerk Altenburg", "Giorgos Avramidis", "Oemuer Oezkir"]
  s.email       = ["dev@kpuschke.eu", "mail@hinnerk-altenburg.de", "avramidg@gmail.com", "oemuer.oezkir@gmail.com"]
  s.homepage    = "https://github.com/xing/oembed_provider_engine"
  s.summary     = "Oembed Provider Rails 3 Engine"
  s.description = "Oembed Provider Rails 3 Engine"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "addressable"
  s.add_dependency "nokogiri"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "jquery-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "shoulda"
  s.add_development_dependency "capybara"

  # Guard gem to run tests
  s.add_development_dependency "guard-test"
  s.add_development_dependency "rb-inotify"
  s.add_development_dependency "rb-fsevent"
  s.add_development_dependency "rb-fchange"
  s.add_development_dependency "ruby_gntp"

end

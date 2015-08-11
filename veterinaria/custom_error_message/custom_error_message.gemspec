$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "custom_error_message/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "custom_error_message"
  s.version     = CustomErrorMessage::VERSION
  s.authors     = ["graziella"]
  s.email       = ["graziellavillafuerte@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of CustomErrorMessage."
  s.description = "TODO: Description of CustomErrorMessage."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end

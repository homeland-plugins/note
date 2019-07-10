$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "homeland/note/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "homeland-note"
  s.version     = Homeland::Note::VERSION
  s.authors     = ["Jason Lee"]
  s.email       = ["huacnlee@gmail.com"]
  s.homepage    = "https://github.com/ruby-china/homeland-note"
  s.summary     = "Note plugin for Homeland"
  s.description = "Note plugin for Homeland."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails"
end

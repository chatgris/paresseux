# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'paresseux/version'

Gem::Specification.new do |s|
  s.name         = "paresseux"
  s.version      = Paresseux::VERSION
  s.authors      = ["chatgris"]
  s.email        = "jboyer@af83.com"
  s.homepage     = "https://github.com/chatgris/paresseux"
  s.summary      = "Lazy migration tool for active model aware model."
  s.description  = "Lazy migration tool for active model aware model."
  s.files        = `git ls-files app lib`.split("\n")
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.add_development_dependency "rspec",         "~>2.8"
  s.add_development_dependency "activesupport", "~>3.2"
  s.add_development_dependency "mongoid",       "~>2.4"
  s.add_development_dependency "bson_ext",      "~>1.5"
end

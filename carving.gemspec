# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'carving/version'

Gem::Specification.new do |spec|
  spec.name          = "carving"
  spec.version       = Carving::VERSION
  spec.authors       = ["Mark Lanett"]
  spec.email         = ["mark.lanett@gmail.com"]
  spec.summary       = %q{Small helper to tag your logs as widely as possible.}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rails", "~> 3.2.19"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "sqlite3"
end

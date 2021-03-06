# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tempbucket/version'

Gem::Specification.new do |spec|
  spec.name          = "tempbucket"
  spec.version       = Tempbucket::VERSION
  spec.authors       = ["Matthew Rudy Jacobs"]
  spec.email         = ["MatthewRudyJacobs@gmail.com"]
  spec.summary       = %q{Tempfiles stored on S3}
  spec.description   = %q{a library built around fog, which stores tempfile-like objects in S3}
  spec.homepage      = "https://github.com/matthewrudy/tempbucket"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "fog"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end

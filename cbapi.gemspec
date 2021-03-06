# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cbapi/version'

Gem::Specification.new do |spec|
  spec.name          = "cbapi"
  spec.version       = Cbapi::VERSION
  spec.authors       = ["Jonatan Reiners"]
  spec.email         = ["jr@encc.de"]
  spec.summary       = %q{very simple wrapper for crunshbang api}
  spec.description   = %q{wrapper for evaluation only company, product, person}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_dependency "json"
end

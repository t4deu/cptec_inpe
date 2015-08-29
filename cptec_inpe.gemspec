# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cptec_inpe/version'

Gem::Specification.new do |spec|
  spec.name          = "cptec_inpe"
  spec.version       = CptecInpe::VERSION
  spec.authors       = ["Tadeu Valentt"]
  spec.email         = ["tadeu.valentt@gmail.com"]

  spec.summary       = %q{Api Client for the CPTEC/INPE weather forecast.}
  spec.description   = %q{Api Client for the CPTEC/INPE weather forecast.}
  spec.homepage      = "https://github.com/t4deu/cptec_inpe"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "httparty"
end

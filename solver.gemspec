# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'solver/version'

Gem::Specification.new do |spec|
  spec.name          = "solver"
  spec.version       = Solver::VERSION
  spec.authors       = ["Bernard Rodier"]
  spec.email         = ["bernard.rodier@gmail.com"]
  spec.description   = %q{Solver games tools}
  spec.summary       = %q{This gem provide tool to build a graph of possible move from
  a start postion to a final solved position and return this short path possible}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "log4r"
end

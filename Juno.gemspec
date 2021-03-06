# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Juno/version'

Gem::Specification.new do |spec|
  spec.name          = "Juno"
  spec.version       = Juno::VERSION
  spec.authors       = ["Christopher Ostrowski"]
  spec.email         = ["chris@reppro.co"]

  spec.summary       = %q{A collection of utitlies to help writing better rails-based service objects.}
  spec.homepage      = "https://github.com/RepPro/Juno"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "activerecord"
  spec.add_dependency "activesupport"
end

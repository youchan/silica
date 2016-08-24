# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'silica/version'

Gem::Specification.new do |spec|
  spec.name          = "silica"
  spec.version       = Silica::VERSION
  spec.authors       = ["youchan"]
  spec.email         = ["youchan01@gmail.com"]

  spec.summary       = %q{Web application framework spcialized for the single page applications using Opalrb.}
  spec.description   = %q{Web application framework spcialized for the single page applications using Opalrb.}
  spec.homepage      = "https://github.com/youchan/silica"

  spec.files         = Dir['lib/**/*.rb'] + Dir['bin/*']
  spec.bindir        = "exe"
  spec.executables   = "silica"
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "thor"
  spec.add_runtime_dependency "git"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

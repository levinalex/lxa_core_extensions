# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lxa_core_extensions/version'

Gem::Specification.new do |gem|
  gem.name          = "lxa_core_extensions"
  gem.version       = LxaCoreExtensions::VERSION
  gem.authors       = ["Levin Alexander"]
  gem.email         = ["mail@levinalex.net"]
  gem.description   = "simple core extensions"
  gem.summary       = "simple utility methods like Hash#compact and Enumerable#build_hash"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "minitest"
  gem.add_development_dependency "rake"
end

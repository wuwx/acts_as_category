# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acts_as_category/version'

Gem::Specification.new do |spec|
  spec.name          = "acts_as_category"
  spec.version       = ActsAsCategory::VERSION
  spec.authors       = ["wuwx"]
  spec.email         = ["wuweixin@gmail.com"]
  spec.description   = "acts_as_category"
  spec.summary       = "acts_as_category"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

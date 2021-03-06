# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "versio_rac1/podcast/version"

Gem::Specification.new do |spec|
  spec.name          = "versio_rac1-podcast"
  spec.version       = VersioRac1::Podcast::VERSION
  spec.authors       = ["Josep"]
  spec.email         = ["apuratepp@gmail.com"]

  spec.summary       = "Versió RAC1 Podcast manager"
  spec.description   = "Versió RAC1 Podcast manager."
  spec.homepage      = "https://github.com/apuratepp/versio_rac1-podcast"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "faraday"
  spec.add_dependency "nokogiri"
  spec.add_dependency "virtus"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "reek"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end

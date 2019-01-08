# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paperdrive/version'

Gem::Specification.new do |spec|
  spec.name          = 'Paperdrive'
  spec.version       = Paperdrive::VERSION
  spec.authors       = %w[rnitta]
  spec.email         = ['attinyes@gmail.com']

  spec.summary       = 'Unofficial Paperdrive API wrapper gem'
  spec.description   = 'Unofficial Ruby wrapper for the Pipedrive API'
  spec.homepage      = 'https://github.com/rnitta/paperdrive'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]

  spec.add_dependency 'http', '~> 3.0'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.62.0'
end

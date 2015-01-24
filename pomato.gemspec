# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pomato/version'

Gem::Specification.new do |spec|
  spec.name          = 'pomato'
  spec.version       = Pomato::VERSION
  spec.authors       = ['Mark Ryall']
  spec.email         = ['mark@ryall.name']
  spec.summary       = %q{command line pomodoro tool}
  spec.homepage      = 'http://github.com/markryall/pomatorb'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'daemons', '~> 1.1'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end

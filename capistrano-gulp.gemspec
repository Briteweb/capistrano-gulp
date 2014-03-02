# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-gulp'
  spec.version       = '0.0.1'
  spec.authors       = ['Alessandro Biavati']
  spec.email         = ['abiavati@gmail.com']
  spec.description   = %q{Gulp support for Capistrano 3.x}
  spec.summary       = %q{This gem will let you run Gulp tasks with Capistrano 3.x.}
  spec.homepage      = 'https://github.com/BRITEWEB/capistrano-gulp'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '~> 3.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 10.0'
end

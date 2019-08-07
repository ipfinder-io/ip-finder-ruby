# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ipfinder/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mohamed Ben rebia"]
  gem.email         = ["mohamed@ipfinder.io"]
  gem.description   = %q{official Ruby library for IPfinder}
  gem.summary       = %q{IPFinder Ruby Client Library}
  gem.homepage      = 'https://ipfinder.io/'
  gem.license       = 'Apache-2.0'
  gem.required_ruby_version = ">= 2.0.0"
  gem.files         =  Dir['lib/**/*.rb']
  gem.test_files    =  Dir['test/**/*.rb']

  gem.add_runtime_dependency 'json', '~> 2.1'

  gem.name          = "Ipfinder"
  gem.require_paths = ['lib']
  gem.version       = Ipfinder::VERSION

end

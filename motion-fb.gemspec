# -*- encoding: utf-8 -*-
VERSION = "0.0.1"

Gem::Specification.new do |gem|
  gem.name          = "motion-fb"
  gem.version       = VERSION
  gem.authors       = ["Silas J. Matson"]
  gem.email         = ["silas@infinite.red"]
  gem.summary       = %q{Easy Facebook Setup in your RubyMotion iOS App}
  gem.description   = %q{Provides a simple hook into the RubyMotion build system that abstracts the boilerplate of setting up Facebook}
  gem.homepage      = "https://github.com/silasjmatson/motion-fb"
  gem.license       = "MIT"

  files = []
  files << 'README.md'
  files << 'lib/motion-fb.rb'
  gem.files         = files
  gem.executables   = [] # gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = [] # gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
end

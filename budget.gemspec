# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'budget/version'

Gem::Specification.new do |gem|
  gem.name          = "budget"
  gem.version       = '1.0.0'
  gem.authors       = ["DrSayre"]
  gem.date	    = '2013-09-08'
  gem.email         = ["DrSayre2002@yahoo.com"]
  gem.description   = 'Easy to use class to create a personal monthly budget.'
  gem.summary	    = 'Easy to use class to create a personal monthly budget.'
  gem.homepage      = "https://github.com/DrSayre/budget"

  gem.files         = ["lib/budget.rb"]
  gem.test_files    = ["test/test_budget.rb"]
end

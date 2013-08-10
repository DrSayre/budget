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
  gem.description   = 'A class to create a budget'
  gem.summary	    = 'A class to create a budget'
  gem.homepage      = "https://github.com/DrSayre/budget"

  gem.files         = ["lib/budget.rb"]
  gem.test_files    = ["test/test_budget.rb"]
end

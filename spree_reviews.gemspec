Gem::Specification.new do |s|
  s.platform     = Gem::Platform::RUBY
  s.name         = 'spree_reviews'
  s.version      = '0.20.0'
  s.summary      = 'Adds reviews and ratings to Spree products'
  s.description  = 'Adds reviews and ratings to Spree products'
  s.required_ruby_version = '>= 1.8.7'
  
  s.authors      = ['sebastyuiop', 'Thomas von Deyen']
  
  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'
  
  s.add_dependency('spree_core', '>= 0.70')
end

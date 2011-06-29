Reviews
=======

Updated and refactored Rails 3 Gem of the old [spree-reviews plugin](https://github.com/paulcc/spree-reviews) from [Paul Callaghan](http://www.free-variable.org/).


Usage
-----

1. Add into your Gemfile:

  gem 'spree-reviews', :git => 'git://github.com/tvdeyen/spree-reviews.git'

2. Run the installation rake task:

  bundle exec rake spree_reviews:install
  
3. And run the migration:

  bundle exec rake db:migrate


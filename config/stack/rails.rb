package :rails do
  description 'Ruby on Rails'
  gem 'rails'
  
  verify do
    has_gem 'rails'
  end
  
  requires :ruby_enterprise
end

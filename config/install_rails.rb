# Require our stack
%w(essential apache scm ruby_enterprise mysql mailserver rails typo3).each do |r|
  require File.join(File.dirname(__FILE__), 'stack', r)
end

policy :xeriom_rails, :roles => :app do
  requires :webserver               # Apache

  requires :apache_etag_support     # == Apache extras
  requires :apache_deflate_support  # Read about these specialties in 
  requires :apache_expires_support  # stack/apache.rb

  requires :appserver               # Passenger
  requires :ruby_enterprise         # Ruby Enterprise edition
  requires :database                # MySQL or Postgres
  requires :ruby_database_driver    # mysql or postgres gems
  requires :scm                     # Git
  requires :mailserver
  requires :rails
end

deployment do
  # mechanism for deployment
  delivery :capistrano do
    begin
      recipes 'Capfile'
    rescue LoadError
      recipes 'deploy'
    end
  end
 
  # source based package installer defaults
  source do
    prefix   '/usr/local'
    archives '/usr/local/sources'
    builds   '/usr/local/build'
  end
end

# Depend on a specific version of sprinkle 
begin
  gem 'crafterm-sprinkle', ">= 0.2.2" 
rescue Gem::LoadError
  puts "sprinkle 0.2.2 required.\n Run: `sudo gem install sprinkle`"
  exit
end
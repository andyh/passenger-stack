# Require our stack
%w(tools essential apache scm ruby_enterprise mysql mailserver rails typo3).each do |r|
  require File.join(File.dirname(__FILE__), 'stack', r)
end

policy :xeriom_php, :roles => :app do
  requires :tools
  requires :webserver
  requires :database                # MySQL
  requires :scm                     # Git
  requires :mailserver
  requires :php
  requires :graphicsmagick
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
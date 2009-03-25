package :mailserver do
  description 'Postfix Mailserver'
  apt 'postfix' do
    pre :install, 'apt-get update'
  end

  verify do
    has_executable 'master'
  end
  
  requires :build_essential
end

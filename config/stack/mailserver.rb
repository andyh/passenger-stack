package :postfix, :provides => :mailserver do
  description 'Postfix Mailserver'
  apt 'postfix' do
    pre :install, 'apt-get update'
  end

  verify do
    has_file '/usr/lib/postfix/master'
  end
  
  requires :build_essential
  requires :mailutils
end

package :mailutils do
  description 'Mail utilities'
  apt 'mailutils'
end
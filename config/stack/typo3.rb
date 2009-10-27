package :php do
  description 'PHP for Apache'
  apt 'php5 libapache2-mod-php5 php5-cli php5-common php5-curl php5-gd php5-mysql php5-xmlrpc'
  
  verify do
    has_executable '/usr/bin/php'
  end

  requires :build_essential
end

package :graphicsmagick do
  description 'GraphicsMagick'
  apt 'graphicsmagick'
  
  verify do
    has_executable '/usr/bin/gm'
  end
end
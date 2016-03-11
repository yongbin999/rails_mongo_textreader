#update system core
sudo apt-get update
sudo apt-get install curl

#install rvm with ruby
\curl -L https://get.rvm.io | bash -s stable --ruby
rvm get stable --autolibs=enable
rvm install ruby

#install rails 4.1.0
gem install rails --version=4.1.0

#install foreman server plugin for unicorn
sudo apt-get install ruby-foreman

# install lib dependencies from gemfile
bundle install
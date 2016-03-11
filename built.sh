#update system core
sudo apt-get update
sudo apt-get install curl

#install rvm with ruby
\curl -L https://get.rvm.io | bash -s stable --ruby
rvm get stable --autolibs=enable
rvm install ruby

#install rails 4.1.0
gem install rails --version=4.1.0


#install mongo on ubuntu
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org


#install foreman server plugin for unicorn
sudo apt-get install ruby-foreman

# install lib dependencies from gemfile
bundle install
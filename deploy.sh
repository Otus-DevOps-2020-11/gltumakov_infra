#!/bin/bash

echo 'Init scripts started...'

./install_ruby.sh
./install_mongodb.sh

echo 'Init finished'

echo '------------------'

echo 'Starting mongod...'
sudo systemctl start mongod
sudo systemctl enable mongod
echo 'mongod started'

echo '------------------'

echo 'Installing git...'
sudo apt-get install -y git

echo 'Cloning repo...'
git clone -b monolith https://github.com/express42/reddit.git

echo '------------------'

echo 'executing bundle install'
cd reddit && bundle install

echo '------------------'

echo 'Starting application...'
puma -d

STARTED=$(ps aux | grep puma | wc -l)

if [ $STARTED -eq 2 ]
  then
    echo 'Application started and listening on port 9292...'
fi

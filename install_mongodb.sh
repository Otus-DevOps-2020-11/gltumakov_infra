#!/bin/bash

echo '------------------'

echo 'adding keys and mongo repository...'
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
echo 'keys and mongo repository have been added'

echo '------------------'

echo 'updating apt-get...'
sudo apt-get update

echo 'installing mongodb...'
sudo apt-get install -y mongodb-org
echo 'mongodb has been installed'

echo '------------------'

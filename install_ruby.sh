#!/bin/bash

echo '------------------'

echo 'executing apt update...'
sudo apt update

echo 'installing ruby...'
sudo apt install -y ruby-full ruby-bundler build-essential
echo 'ruby has been installed'

echo '------------------'

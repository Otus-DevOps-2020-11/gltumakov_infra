#!/bin/bash

sleep 30
apt-get install -y git

cd /usr/local

git clone -b monolith https://github.com/express42/reddit.git

cd reddit && bundle install

mv /tmp/puma.service /etc/systemd/system/puma.service

systemctl daemon-reload
systemctl start puma.service
systemctl enable puma.service

echo 'Application started and listening on port 9292...'

echo '------------------'

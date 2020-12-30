___
HMW 5
___
bastion_IP = 84.201.174.18
someinternalhost_IP = 10.130.0.31
___

## To connect to the remote host in a private subnet from your local machine, use this command:
```ssh -i ~/.ssh/appuser.pub -A -J appuser@<bastion_IP> appuser@<someinternalhost_IP>```
___

## To connect to the remote host in a private subnet by using *ssh alias*, follow the list of instructions below:

### 1. Open ssh config file:
`$ vim ~/.ssh/config`

### 2. Put this text in the opened file:
```
Host yandex-bastion
    Hostname <bastion_IP>
    User appuser
    IdentityFile ~/.ssh/appuser

Host someinternalhost
    Hostname <someinternalhost_IP>
    User appuser
    IdentityFile ~/.ssh/appuser
    ProxyJump yandex-bastion
```
### 3. Reload config:

`$ source ~/.ssh/config`


### 4. Now you can use *ssh alias* to connect to the remote host:
`$ ssh someinternalhost`
___
## After configuring VPN, you can connect to your remote host directly:
`$ ssh -i ~/.ssh/appuser appuser@<someinternalhost_IP>`

___
HMW 6
___
testapp_IP = 178.154.231.45
testapp_port = 9292

## Scenario for manual execution of init scripts
### copy init scripts to your remote machine:
`$ scp -i ~/.ssh/appuser install_ruby.sh install_mongodb.sh deploy.sh yc-user@<testapp_IP>:/home/yc-user`

### connect to your instance and execute deploy script:
```
$ ssh ~/.ssh/appuser yc-user@<testapp_IP>
$ ./deploy.sh
```
___
### Scenario for automated run of init scripts:
`$ ./startup-script.sh`

#### Startup script code:
```
#!/bin/bash

yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=./metadata.yaml
```

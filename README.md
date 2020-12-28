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

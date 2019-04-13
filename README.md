# TechTest

## Create a new user

### adder.sh
Bash script for add new user with default password.
The user is forced to change his password on the next log on.
Password minimal length in system = 12 
- **usage:** 
```sh
$ adduser.sh username
```
---

### ansible roles
#### add_users 
Ansible role for add a new user

ansible/roles/adduser/vars/main.yml - all users parameters are set in this file. 

|Parameter | Description|
|--------|---------|
|name |username |
|shell | path to user's shell |
|nofile |open file limit |
|groups |user membership in groups |
|pymodules | Python modules for virtual env|

- **usage:** 
```sh
$ ansible-playbook -i hosts.ini add_users.yml -e target=target_host
```
target_host - target host or group of hosts from inventory file hosts.ini
#### rmuser
Ansible role for remove an existing user
ansible/roles/adduser/vars/main.yml - list of users
- **usage:** 
```sh
$ ansible-playbook -i hosts.ini rmuser.yml -e target=target_host
```
target_host - target host or group of hosts from inventory file hosts.ini

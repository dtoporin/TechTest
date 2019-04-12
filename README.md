## TechTest

# Create a new user

##### adder.sh
Bash script for add new user with default password.
The user is forced to change his password on the next log on.
Password minimal length in system = 12 

#### ansible roles
##### add_users 
Ansible role for add a new user

ansible/roles/adduser/vars/main.yml - all users parameters are set in this file. 

|Parameter | Description|
|--------|---------|
|name |username |
|shell | path to user's shell |
|nofile |open file limit |
|groups |user membership in groups |
|pymodules | Python modules for virtual env|

##### rmuser
Ansible role for remove an existing user

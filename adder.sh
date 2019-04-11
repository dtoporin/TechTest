#!/bin/bash
echo "Add user $1"
adduser --disabled-password --gecos "" $1
echo "Set up default password"
echo "$1:12345" | chpasswd
echo "Force a user to change their password at next logon"
chage -d 0 $1
echo "Create directories in $1's home"
sudo -H -u $1 bash -c "mkdir /home/$1/{git,documentation,'export',.ssh,.credentials}"
echo "Generate rsa ssh keypair for $1"
sudo -H -u $1 ssh-keygen -b 4096 -f /home/$1/.ssh/id_rsa -q -N ""
sudo -H -u $1 cp /home/$1/.ssh/id_rsa.pub /home/$1/.ssh/authorized_keys
echo "Copy credentials file"
cp ./app /home/$1/.credentials/app
chown -R $1:$1 /home/$1/.credentials
echo "Add PATH env"
echo 'export PATH="$PATH:/opt/app/bin:/opt/app2/exec"' >> /home/$1/.profile
echo "Add sudo rights fo script running"
echo "$1    ALL=NOPASSWD:   /usr/local/sbin/generate_report.sh" > /etc/sudoers.d/$1
echo "Create virtenv in $1's home"
sudo -H -u $1 bash -c "virtualenv /home/$1/venv_project_01 && source /home/$1/venv_project_01/bin/activate && pip install cryptography Requests && deactivate"
echo "Set open file limit for $1"
echo "$1             soft    nofile          10240" >> /etc/security/limits.conf
echo "$1             hard    nofile          10240" >> /etc/security/limits.conf

1) Generate keypair (or create it in ec2)
ssh-keygen -t rsa -f your_name

2) import keypair in EC2 (Network & Security / Key Pairs)

3) Create instance (Amazon EC2) (t2.micro, defaults and only ssh in SG since there are no minions outside)

4) Install Salt master and minion (Get key, update sources and install)
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
sudo sh -c  "echo 'deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main' > /etc/apt/sources.list.d/saltstack.list"
sudo apt-get update
sudo apt-get install salt-master salt-minion salt-ssh salt-cloud salt-doc python-git python-dulwich python-pygit2

5) Create directories for salt master.
sudo mkdir -p /srv/{salt,pillar}

6) Add the following lines to /etc/salt/master (Should contain only this lines) . Base in /srv/salt, gitfs for user-formula and Pillar base in /srv/pillar.
file_roots:
   base:
     - /srv/salt/

fileserver_backend:
  - roots
  - git

gitfs_remotes:
   - git://github.com/saltstack-formulas/users-formula.git

pillar_roots:
  base:
    - /srv/pillar

7) Add the following line to /etc/salt/minion , it should be the only uncommented one.
master: 127.0.0.1

8) Restart salt master
sudo service salt-master restart

9) Add the localhost key to salt master so the minion is accepted.
sudo salt-key -a $(hostname -f)

10) Create extra dirs (not needed if cloning git repo)
mkdir /srv/salt/{scripts,keys}

11) Add logger.sh to /srv/salt/scripts, logger.sls to /srv/salt, top.sls to /srv/salt, top.pillar.sls to /srv/pillar/top.sls, users.sls to /srv/pillar and your_name.pub to /srv/salt/keys/your_name.id_rsa.pub . This can be done cloning the github repo.
sudo git clone https://github.com/matiasozdy/probable-fiesta.git
sudo mv -f probable-fiesta/* /srv/
sudo rm -rf probable-fiesta

12) Replace key with corresponding one
sudo sh -c "echo 'CORRESPONDING_KEY' > /srv/salt/keys/your_name.id_rsa.pub"

12) apply states to host
sudo salt $(hostname -f) state.highstate

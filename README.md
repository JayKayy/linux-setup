# linux-setup
Ansible automation for configuring Linux desktops

This repository is for automating the configuration and setup of linux(mainly Fedora) installs.


To begin modify `inventory/hosts` and specify the list of hosts you wish to configure.

Next, modify `vars/vars.yml` file with the desired configuration options listed.

Once the variables are set, ensure the following:
 - `sshd` is running and enabled
 - host key was accepted
 - targets have a `/usr/bin/python` interpreter defined

Then run the setup playbook:

`ansible-playbook -u <user> -kK setup.yml`

Known issues:
 - flatpaks are unable to be accessed after install. Bug seems to give `/var/lib/flatpak` the wrong permissions. This fix is allowing other users read and exec permissions on the directory: `sudo chmod -R 755 /var/lib/flatpak/`

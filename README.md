# linux-setup
Ansible automation for configuring Linux desktops

This repository is for automating the configuration and setup of linux(mainly Fedora) installs.


To begin modify `inventory/hosts` and specify the list of hosts you wish to configure.

Next, modify `inventory/group_vars/install.yml` file with the desired configuration options.

Once the variables are set run the setup playbook:

`ansible-playbook -i inventory/hosts playbooks/setup.yml`

# linux-setup
Ansible automation for configuring Linux desktops

This repository is for automating the configuration and setup of linux(mainly Fedora) installs.


To begin modify the `inventory/group_vars/install.yml` file with the desired configurations.


Once the variables are set run the setup playbook:
`ansible-playbook -i inventory/inv playbooks/setup.yml`

#!/bin/bash
set -e

ANSIBLE_CONFIG=ansible/ansible.cfg \
ansible-playbook -i ansible/inventory.ini ansible/setup_minecraft.yml

#!/usr/bin/env sh

ansible-playbook --connection local --inventory localhost, \
  --tags "setup-user,pacman" \
  --extra-vars="ansible_user=${1}" \
  install.yml

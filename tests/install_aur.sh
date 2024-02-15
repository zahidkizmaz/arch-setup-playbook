#!/usr/bin/env sh

ansible-playbook --connection local --inventory localhost, \
  --tags "aur" \
  --extra-vars="ansible_user=${1}" \
  install.yml

# Arch Linux Personal Setup Playbook

## How to run

- Make sure ansible is installed in the host machine.
- Make sure python3 is installed in the destination machine.
- Make sure host machine can connect to destination machine via ssh.

### Create an inventory file

```yml
---
all:
  hosts:
    {{ host_address }}:
      ansible_user: {{ user_name }}

```

### Run the playbook
```
ansible-playbook -i inventory.yml main.yml -K
```

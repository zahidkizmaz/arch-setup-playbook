# Arch Linux Personal Setup Playbook

## How to run

### Destination Machine:

After a fresh arch installation before running the playbook you may follow these steps:

1. Add your non root user to sudo (wheel) group. This user also will be used as ansible user.
2. Install dependencies:
    ```
    pacman -S openssh python python-pip
    ```
3. Enable ssh service:
    ```
    systemctl enable sshd
    ```

### Host Machine:

Add host machine's ssh keys to destination machine.

```
ssh-copy-id {{user name}}@{{ ip of the destination machine}}

```

#### Create an inventory file

```yml
---
all:
  hosts:
    {{ host_address }}:
      ansible_user: {{ user_name }}

```

#### Install playbook dependencies
```
ansible-galaxy install -r requirements.yml
```

#### Run the playbook
```
ansible-playbook -i inventory.yml main.yml -K
```

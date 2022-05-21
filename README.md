# My Personal Arch Linux Setup Playbook

![desktop](https://user-images.githubusercontent.com/15658403/169669672-5638299d-fc7c-4a6d-80f3-6c1e8723eb8e.png)
![neofetch](https://user-images.githubusercontent.com/15658403/169669675-a207218d-219d-4afd-a70b-3ff43a84965e.png)
![nvim](https://user-images.githubusercontent.com/15658403/169669677-01e637d0-58b2-4460-a842-0ae72f1732da.png)


## How to run

### Destination Machine:

After a fresh arch installation and before running the playbook, you may follow these steps:

1. Add your non-root user to sudo (wheel) group. This user also will be used as an ansible user.
2. Install dependencies:
    ```
    pacman -S openssh python python-pip
    ```
3. Enable ssh service:
    ```
    systemctl enable sshd
    ```

### Host Machine:

Add the host machine's ssh keys to the destination machine.

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

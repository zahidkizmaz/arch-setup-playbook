# My Personal Arch Linux Setup Playbook

![desktop](https://user-images.githubusercontent.com/15658403/184225285-cebcbfde-e5f2-427d-a71a-8a817a4b2c2e.png)

## How to run

### Destination Machine:

After a fresh arch installation and before running the playbook, you may follow these steps:

1. Add your non-root user to sudo (wheel) group. This user also will be used as an ansible user.
2. Install dependencies:
    ```shell
    pacman -S openssh python python-pip
    ```
3. Enable ssh service:
    ```shell
    systemctl enable sshd
    ```

### Host Machine:

Add the host machine's ssh keys to the destination machine.

```shell
ssh-copy-id {{user name}}@{{ ip of the destination machine}}

```

#### Create an inventory file

```yml
---
all:
    hosts:
        { { host_address } }:
            ansible_user: { { user_name } }
```

#### Install ansible

##### [Official installation guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

_OR_

##### [Poetry](https://python-poetry.org/)

Recommended for local development

```shell
poetry install
```

Now it is possible to run following commands with `poetry run` without having to install ansible globally.

**Example:**

```shell
poetry run ansible-galaxy install -r requirements.yml
```

#### Install playbook dependencies

```shell
ansible-galaxy install -r requirements.yml
```

#### Run the install playbook

```shell
ansible-playbook -K --inventory inventory.yml install.yml
```

### Update the system

This updates all the packages installed by playbook.

Such as:

-   AUR packages
-   pacman packages
-   zsh plugins
-   pipx packages
-   flatpak packages
-   asdf plugins
-   tmux plugins
-   npm global plugins
-   rust programming language
-   nvim packages and tree sitter grammars

#### Run the update playbook remotely

```shell
ansible-playbook -K --inventory inventory.yml update.yml
```

#### Run the update playbook locally

```shell
ansible-playbook -K --connection local --inventory localhost, update.yml
```

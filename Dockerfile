FROM docker.io/library/archlinux:latest

RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm ansible sudo xorg xorg-server

RUN echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN useradd --create-home -G wheel batman
USER batman

COPY . /app
WORKDIR /app

RUN ansible-galaxy install -r requirements.yml

RUN ["tests/install_pacman.sh", "batman"]
RUN ["tests/install_aur.sh", "batman"]
RUN ["tests/install_config.sh", "batman"]

CMD "/bin/zsh"

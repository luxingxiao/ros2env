FROM dorowu/ubuntu-desktop-lxde-vnc:bionic

RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod
USER gitpod
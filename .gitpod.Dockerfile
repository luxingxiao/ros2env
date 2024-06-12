FROM dorowu/ubuntu-desktop-lxde-vnc:bionic

RUN apt-get update -q && \
    apt-get upgrade -yq && \
    apt-get install -yq wget curl git build-essential vim sudo lsb-release locales bash-completion tzdata gosu && \
    rm -rf /var/lib/apt/lists/*
# Create the gitpod user. UID must be 33333.
RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod
USER gitpod

COPY ./ros-eloquent-desktop.sh /home/gitpod/ros-eloquent-desktop.sh
RUN mkdir -p /tmp/ros_setup_scripts_ubuntu && mv /home/gitpod/ros-eloquent-desktop.sh /tmp/ros_setup_scripts_ubuntu/ && \
    chown -R gitpod:gitpod /tmp/ros_setup_scripts_ubuntu && \
    /tmp/ros_setup_scripts_ubuntu/ros-eloquent-desktop.sh && \
    rm -rf /var/lib/apt/lists/*


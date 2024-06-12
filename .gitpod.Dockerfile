FROM dorowu/ubuntu-desktop-lxde-vnc:bionic
LABEL maintainer="Tiryoh<tiryoh@gmail.com>"

RUN apt-get update && apt-get install -yq \
    git \
    git-lfs \
    sudo \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

# RUN apt-get update -q && \
#     apt-get upgrade -yq && \
#     apt-get install -yq wget curl git build-essential vim sudo lsb-release locales bash-completion tzdata gosu && \
#     rm -rf /var/lib/apt/lists/*

# Create the gitpod user. UID must be 33333.
RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod

# COPY ./ros-eloquent-desktop.sh /ros-eloquent-desktop.sh
# RUN chmod +x /ros-eloquent-desktop.sh
# RUN /ros-eloquent-desktop.sh
# RUN rm -rf /var/lib/apt/lists/*

USER gitpod


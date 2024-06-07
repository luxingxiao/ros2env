FROM tiryoh/ros2-desktop-vnc:jazzy

RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod

USER gitpod
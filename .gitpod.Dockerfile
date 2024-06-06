FROM gitpod/workspace-full-vnc

# Set the locale
RUN locale  # check for UTF-8

RUN sudo apt update && sudo apt install locales
RUN sudo locale-gen en_US en_US.UTF-8
RUN sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8

RUN locale  # verify settings

# Enable required repositories
RUN sudo apt install software-properties-common
RUN sudo add-apt-repository universe

RUN sudo apt update && sudo apt install curl -y
RUN sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

#Install development tools
RUN sudo apt update && sudo apt install -yq ros-dev-tools 

# Install ROS 2
RUN sudo apt update
RUN sudo apt -yq upgrade
RUN sudo apt install -yq ros-iron-desktop

# Setup environment
RUN echo "source /opt/ros/iron/setup.bash" >> ~/.bashrc

# Install turtlesim
RUN sudo apt install -yq ros-iron-turtlesim

# Install rqt
RUN sudo apt install -yq ~nros-iron-rqt*

USER gitpod

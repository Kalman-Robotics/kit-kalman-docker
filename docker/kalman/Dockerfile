ARG distro_tag=humble
FROM osrf/ros:$distro_tag-desktop

WORKDIR /kalman_ws

RUN git clone https://github.com/micro-ROS/micro-ROS-Agent src/micro-ROS-Agent \
&&  cd src/micro-ROS-Agent \
&&  git checkout 30377bbd86ff7ea93ca69a3b37997fd235385e1f \
&&  cd /kalman_ws \
&&  . /opt/ros/$ROS_DISTRO/setup.sh \
&&  apt update \
&&  apt install -y ed python3-pip \
&&  apt install -y ros-$ROS_DISTRO-rmw-fastrtps-cpp \
&&  apt remove -y ros-$ROS_DISTRO-rmw-cyclonedds-cpp \
&&  rosdep update --rosdistro $ROS_DISTRO\
&&  rosdep install --from-paths src --ignore-src -y \
&&  colcon build \
&&  . install/local_setup.sh \
&&  rm -rf log/ build/ src/

# Disable shared memory
COPY disable_fastdds_shm.xml disable_fastdds_shm_localhost_only.xml /tmp/

ENV RMW_IMPLEMENTATION=rmw_fastrtps_cpp
ENV MICROROS_DISABLE_SHM=1

WORKDIR /kalman_ws

RUN apt install -y python3-pip nano inotify-tools \
ros-$ROS_DISTRO-gazebo-ros-pkgs ros-$ROS_DISTRO-joint-state-publisher-gui \
ros-$ROS_DISTRO-cartographer-ros \
ros-$ROS_DISTRO-nav2-map-server ros-$ROS_DISTRO-nav2-bringup \
ros-$ROS_DISTRO-joint-state-publisher ros-$ROS_DISTRO-xacro
# &&  pip3 install aiortc aiohttp opencv-python

RUN apt install -y ros-$ROS_DISTRO-navigation2 ros-$ROS_DISTRO-nav2-bringup
# ros-iron-nav2-route

RUN apt update && apt upgrade -y

RUN . /opt/ros/$ROS_DISTRO/setup.sh \
# &&  git clone https://github.com/kalman-robotics/kalman_interfaces.git src/kalman_interfaces \
&&  git clone --recurse-submodules https://github.com/Kalman-Robotics/kit-kalman-ros2.git src/kit-kalman-ros2 \
&&  rosdep update --rosdistro $ROS_DISTRO \
&&  rosdep install --from-paths src --ignore-src -y \
&&  colcon build --symlink-install \
&&  rm -rf log/

RUN echo ". /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
RUN echo ". /kalman_ws/install/setup.bash" >> ~/.bashrc
RUN echo "export KALMAN_ROBOT=kalman_description" >> ~/.bashrc
RUN echo "alias kalman='ros2 run kalman cli'" >> ~/.bashrc

RUN DEBIAN_FRONTEND=noninteractive apt install -y tigervnc-standalone-server xfce4 xfce4-terminal \
&&  mkdir ~/.vnc \
&&  echo startxfce4 > ~/.vnc/xstartup \
&&  chmod +x ~/.vnc/xstartup \
&&  apt autoremove -y \
&&  rm -rf /var/lib/apt/lists/*


RUN rm /*.sh
COPY ./kalman-entrypoint.sh /
COPY ./.bash_history /root


EXPOSE 8888/udp
# EXPOSE 5601/tcp
ENTRYPOINT ["/bin/sh", "/kalman-entrypoint.sh"]
CMD ["bash"]

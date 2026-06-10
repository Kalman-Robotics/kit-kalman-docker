@echo off
docker run --name nexus -it --rm -p 8880-8895:8880-8895/udp -p 4430:4430/tcp -e DISPLAY=host.docker.internal:0.0 -e LIBGL_ALWAYS_INDIRECT=0 -e LIBGL_ALWAYS_SOFTWARE=1 -e GALLIUM_DRIVER=softpipe -e RMW_IMPLEMENTATION=rmw_fastrtps_cpp -e MICROROS_DISABLE_SHM=1 -e ROS_DOMAIN_ID=0 kalmanrobotics/kalman-kit:humble

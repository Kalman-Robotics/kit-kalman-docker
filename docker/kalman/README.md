A pre-built Docker image is available at [Docker Hub](https://hub.docker.com/repository/docker/kalmanrobotics/kalman-kit/general)

## Re-building the Docker image
If you would like to modify and/or rebuild this image:
- change your current directory in your shell to the location of this Docker file
- optionally, edit the Dockerfile as you wish
- run the command below to build the Docker image using ROS2 `iron` release:


1. Reconstruir la imagen **Sin cache**
```
cd docker\kalman
docker build --no-cache -t kalmanrobotics/kalman-kit:humble --build-arg distro_tag=humble .
```
2. Reconstruir la imagen **Con cache**
```
cd docker\kalman
docker build  -t kalmanrobotics/kalman-kit:humble --build-arg distro_tag=humble .
```

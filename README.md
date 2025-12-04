# kit-kalman-docker

Este repositorio contiene instrucciones para levantar un Docker donde ejecutar el agente de micro-ROS y paquetes de ROS2 del kit-kalman de robótica educativa. Incluye configuraciones y pasos específicos para entornos Windows y Ubuntu.

- [kit-kalman-docker](#kit-kalman-docker)
  - [Consideraciones previas:](#consideraciones-previas)
  - [Requisitos:](#requisitos)
  - [Uso:](#uso)
  - [Guías para iniciar contenedor Docker:](#guías-para-iniciar-contenedor-docker)
  - [Anexos](#anexos)

## Consideraciones previas:
- Si utiliza Ubuntu 22.04, no es necesario que utilice docker, siempre y cuando tenga instalado ROS2 Humble y micro-ROS. Caso contrario, puede seguir las instrucciones de este repositorio.
- En Windows, es recomendable utilizar WSL2 con Ubuntu 22.04 para una mejor compatibilidad con Docker y ROS2.

## Requisitos:
- Docker instalado
- Git
- Conocimientos básicos de terminal/powershell

## Uso:
1. Clonar o descargar el repositorio.
2. Abrir la guía correspondiente a tu sistema operativo.
3. Seguir una de las guías para construir la imagen o usar una pre-construida e iniciar el contenedor.
4. Siga las [instrucciones del repositorio de ROS2](https://github.com/Kalman-Robotics/kit-kalman-ros2) para ejecutar el agente micro-ROS y paquetes del robot como telemetría, teleoperación, mapeo, navegación, etc.

## Guías para iniciar contenedor Docker:
- [Ubuntu](ubuntu.md)
- [Windows](windows.md)

## Anexos
- [Docker Hub de Kalman Robotics con imágenes pre-construidas](https://hub.docker.com/r/kalmanrobotics/kalman-kit/tags)

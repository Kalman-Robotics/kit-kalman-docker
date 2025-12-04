# kit-kalman-docker

Este repositorio contiene instrucciones para levantar un Docker donde ejecutar el agente de micro-ROS y paquetes de ROS2 del kit-kalman de robótica educativa. Incluye configuraciones y pasos específicos para entornos Windows y Ubuntu.

- [kit-kalman-docker](#kit-kalman-docker)
  - [Consideraciones previas:](#consideraciones-previas)
  - [Requisitos:](#requisitos)
  - [Uso rápido:](#uso-rápido)
  - [Guías:](#guías)

## Consideraciones previas:
- Si utiliza Ubuntu 22.04, no es necesario que utilice docker, siempre y cuando tenga instalado ROS2 Humble y micro-ROS. Caso contrario, puede seguir las instrucciones de este repositorio.
- En Windows, es recomendable utilizar WSL2 con Ubuntu 22.04 para una mejor compatibilidad con Docker y ROS2.

## Requisitos:
- Docker instalado
- Git
- Conocimientos básicos de terminal/powershell

## Uso rápido:
1. Clonar o descargar el repositorio.
2. Abrir la guía correspondiente a tu sistema operativo.
3. Seguir las instrucciones para construir la imagen y ejecutar el contenedor.

## Guías:
- [Ubuntu](ubuntu.md)
- [Windows](windows.md)

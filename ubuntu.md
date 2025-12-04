# Instalación de Kalman en Ubuntu/Linux

- [Instalación de Kalman en Ubuntu/Linux](#instalación-de-kalman-en-ubuntulinux)
  - [1. Instalar Docker](#1-instalar-docker)
  - [2. Clonar repositorio](#2-clonar-repositorio)
  - [3. Descargar imagen Docker](#3-descargar-imagen-docker)
  - [4. Configurar X11 (para GUI)](#4-configurar-x11-para-gui)
  - [5. Uso](#5-uso)
    - [Opción A/B: Crear y ejecutar contenedor](#opción-ab-crear-y-ejecutar-contenedor)
    - [Opción C: Hacer uso del Dev Container (RECOMENDADO)](#opción-c-hacer-uso-del-dev-container-recomendado)
  - [Comandos útiles](#comandos-útiles)

## 1. Instalar Docker
```bash
# Instalar Docker Engine
sudo apt update
sudo apt install -y docker.io docker-compose
sudo systemctl start docker
sudo systemctl enable docker

# Añadir usuario al grupo docker (para ejecutar sin sudo)
sudo usermod -aG docker $USER
newgrp docker
```

## 2. Clonar repositorio
```bash
cd ~
git clone https://github.com/kalman-robotics/kit-kalman-docker
cd kit-kalman-docker
```

## 3. Descargar imagen Docker
**Opción A: Desde internet**
```bash
docker pull kalmanrobotics/kalman-kit:linux-latest
```

**Opción B: Desde USB**
```bash
docker load -i /media/USB/kalman-kit-humble.tar
```

**Opción C: Construir imagen localmente (RECOMENDADO)**
- Abrir el proyecto en VSCode
- Presionar `Ctrl+Shift+P` y seleccionar `Dev Containers: Rebuild and Reopen in Container`
- Seleccionar la opción que incluya la palabra `linux`
- Esperar a que se construya la imagen (puede tardar un rato)

## 4. Configurar X11 (para GUI)
```bash
xhost +local:docker
```

## 5. Uso
### Opción A/B: Crear y ejecutar contenedor
```bash
docker run --name nexus -it --rm \
  -p 8888:8888/udp \
  -p 4430:4430/tcp \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  kalmanrobotics/kalman-kit:humble
```
### Opción C: Hacer uso del Dev Container (RECOMENDADO)
- Abrir el proyecto en VSCode
- Presionar `Ctrl+Shift+P` y seleccionar `Dev Containers: Reopen in Container`
- Seleccionar la opción que incluya la palabra `linux`
- Cuando se inicie el contenedor, abrir una terminal integrada (`Ctrl+j`)

## Comandos útiles

**Detener contenedor:**
```bash
docker stop nexus
```

**Eliminar contenedor:**
```bash
docker rm nexus
```

**Guardar imagen en USB:**
```bash
docker save -o kalman-kit-humble.tar kalmanrobotics/kalman-kit:humble
```
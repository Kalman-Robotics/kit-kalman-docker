# Instalación de Kalman en Windows

## 1. Instalar Docker Desktop
Descarga e instala [Docker Desktop for Windows](https://docs.docker.com/desktop/install/windows-install/)

## 2. Instalar VcXsrv
Descarga e instala [VcXsrv](https://sourceforge.net/projects/vcxsrv/)
- Ejecuta XLaunch, display number: `0`
- Marca "Disable access control"

## 3. Descargar proyecto
```cmd
cd C:\
git clone https://github.com/kalman-robotics/kit-kalman-install kalman
cd C:\kalman\docker\comandos
```

## 4. Descargar imagen Docker
```cmd
docker pull kalmanrobotics/kalman-kit:humble
```

## 5. Usar los scripts

### Crear contenedor:
```cmd
C:\kalman\docker\comandos\crear_contenedor.cmd
```

### Eliminar contenedor:
```cmd
C:\kalman\docker\comandos\eliminar_contenedor.cmd
```


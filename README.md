# Instalación de Kalman en Windows

## 1. Instalar Docker Desktop
Descarga e instala [Docker Desktop for Windows](https://docs.docker.com/desktop/install/windows-install/)

Abre Docker Desktop y déjalo corriendo.

## 2. Instalar VcXsrv
Descarga e instala [VcXsrv](https://sourceforge.net/projects/vcxsrv/)
- Ejecuta XLaunch, display number: `0`
- Marca "Disable access control"

## 3. Descargar proyecto
```cmd
cd C:\
git clone https://github.com/kalman-robotics/kit-kalman-install kalman\install
cd C:\kalman\install
```

## 4. Cargar imagen Docker

### Opción A: Desde internet (6 GB)
```cmd
docker pull kalmanrobotics/kalman-kit:humble
```

### Opción B: Desde USB (recomendado para aulas)
1. Conecta el USB con el archivo `kalman-kit-humble.tar`
2. Ejecuta:
```cmd
C:\kalman\install\docker\comandos\cargar_imagen_usb.cmd
```

O manualmente:
```cmd
docker load -i E:\kalman-kit-humble.tar
```
(Cambia `E:` por la letra de tu USB)

## 5. Crear contenedor
```cmd
C:\kalman\install\docker\comandos\crear_contenedor.cmd
```

---

## Comandos útiles

**Eliminar contenedor:**
```cmd
C:\kalman\install\docker\comandos\eliminar_contenedor.cmd
```

**Verificar imagen instalada:**
```cmd
docker images kalmanrobotics/kalman-kit
```

---

## Para profesores: Crear USB de instalación

```cmd
REM 1. Descargar imagen
docker pull kalmanrobotics/kalman-kit:humble

REM 2. Guardar en archivo
docker save -o kalman-kit-humble.tar kalmanrobotics/kalman-kit:humble

REM 3. Copiar archivo a USB (6 GB)
```




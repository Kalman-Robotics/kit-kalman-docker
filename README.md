# KALMAN ROBOTICS
## Laboratorio Remoto de Robótica
### Guía de comandos — Robot Nexus

Referencia rápida para lanzar el bringup, mapear y ejecutar navegación autónoma.

> ⚠️ Reemplaza `<numero_de_tu_robot>` en todos los comandos.
> Ejemplo robot 11: `ROS_DOMAIN_ID=11`, `microros_port=8891` (8880 + 11).

---

## 1. Descargar el proyecto

Clona el repositorio de Kalman Robotics y crea el contenedor Docker. Ejecutar en PowerShell como Administrador.

**Paso 1 — Clonar el repositorio**
```powershell
cd C:\
git clone https://github.com/kalman-robotics/kit-kalman-docker kalman\install
cd C:\kalman\install
```

**Paso 2 — Crear el contenedor Docker**
```powershell
C:\kalman\install\docker\comandos\crear_contenedor.cmd
```

> ⚠️ PowerShell debe abrirse como Administrador: clic derecho en el ícono → "Ejecutar como administrador".

---

## 2. Ejecutar el agente de micro-ROS

Establece la comunicación entre la PC y el robot. Una vez activo, podrás interactuar con todos los tópicos publicados por el robot.

**Paso 1 — Lanzar el agente**
```bash
ros2 run micro_ros_agent micro_ros_agent udp4 --port 8888
```

> ⚠️ Deja esta terminal abierta durante toda la sesión. Si se cierra, el robot pierde comunicación con la PC.

---

## 3. Lanzar el bringup del robot

Arranca todos los nodos del robot: LiDAR, odometría y micro-ROS. Abrir una nueva terminal en el contenedor.

**Paso 1 — Abrir nueva terminal en el contenedor y setear dominio ROS**
```bash
docker exec -it nexus bash
export ROS_DOMAIN_ID=<numero_de_tu_robot>
```

> ⚠️ Repite estos dos comandos en cada nueva terminal que abras dentro del contenedor.

**Paso 2 — Lanzar el bringup**

Sustituye el número de robot. Ejemplo robot 11 → dominio 11, puerto 8891:

```bash
ros2 launch kalman_bringup kalman_bringup.launch.py \
    lidar_model:=LDROBOT-LD19 \
    use_sim_time:=false \
    use_rviz:=false \
    microros_port:=<8880 + numero_de_tu_robot>
```

Ejemplo completo para el robot 11:

```bash
ros2 launch kalman_bringup kalman_bringup.launch.py \
    lidar_model:=LDROBOT-LD19 \
    use_sim_time:=false \
    use_rviz:=false \
    microros_port:=8891
```

---

## 4. Teleoperación

Controla el robot mediante el teclado, respetando los límites de velocidad del robot. Abrir una nueva terminal en el contenedor.

**Paso 1 — Abrir nueva terminal en el contenedor y setear dominio ROS**
```bash
docker exec -it nexus bash
export ROS_DOMAIN_ID=<numero_de_tu_robot>
```

> ⚠️ Repite estos dos comandos en cada nueva terminal que abras dentro del contenedor.

**Paso 2 — Lanzar la teleoperación**
```bash
ros2 run kalman_teleop teleop_keyboard
```

> ⚠️ El bringup (Sección 3) debe estar corriendo antes de lanzar la teleoperación.

---

## 5. Mapeo con Cartographer (SLAM)

Lanza el mapeo en tiempo real usando Google Cartographer. El robot construirá el mapa mientras se desplaza. Abrir una nueva terminal en el contenedor.

**Paso 1 — Abrir nueva terminal en el contenedor y setear dominio ROS**
```bash
docker exec -it nexus bash
export ROS_DOMAIN_ID=<numero_de_tu_robot>
```

> ⚠️ Repite estos dos comandos en cada nueva terminal que abras dentro del contenedor.

**Paso 2 — Lanzar Cartographer**
```bash
ros2 launch kalman_bringup cartographer.launch.py use_sim_time:=false
```

> ⚠️ El bringup (Sección 3) debe estar corriendo antes de lanzar Cartographer.

---

## 6. Guardar el mapa

Una vez explorado el entorno, guarda el mapa para usarlo en navegación. Abrir una nueva terminal en el contenedor.

**Paso 1 — Abrir nueva terminal en el contenedor y setear dominio ROS**
```bash
docker exec -it nexus bash
export ROS_DOMAIN_ID=<numero_de_tu_robot>
```

> ⚠️ Repite estos dos comandos en cada nueva terminal que abras dentro del contenedor.

**Paso 2 — Ir a la carpeta de mapas y guardar**
```bash
cd src/kit-kalman-ros2/kalman_bringup/map/
ros2 run nav2_map_server map_saver_cli -f mapa_kalman
```

**Paso 3 — Volver a la raíz del workspace**
```bash
cd /kalman_ws/
```

Se generan dos archivos: `mapa_kalman.pgm` (imagen) y `mapa_kalman.yaml` (metadatos).

---

## 7. Navegación autónoma

Con el mapa guardado, lanza el stack de navegación Nav2. Abrir una nueva terminal en el contenedor.

**Paso 1 — Abrir nueva terminal en el contenedor y setear dominio ROS**
```bash
docker exec -it nexus bash
export ROS_DOMAIN_ID=<numero_de_tu_robot>
```

> ⚠️ Repite estos dos comandos en cada nueva terminal que abras dentro del contenedor.

**Paso 2 — Lanzar la navegación**
```bash
ros2 launch kalman_bringup navigation.launch.py \
    use_sim_time:=false \
    robot_model:=kalman_description \
    slam:=False \
    map:=cuarto.yaml
```

> ⚠️ Cambia `cuarto.yaml` por el nombre del mapa guardado en la Sección 6.

---

kalmanrobotics.com · Laboratorio Remoto de Robótica · Lima, Perú

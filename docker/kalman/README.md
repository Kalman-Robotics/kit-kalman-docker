## Reconstruir la imagen Docker

Si desea modificar y/o reconstruir esta imagen:
- Cambia el directorio actual en tu terminal a la ubicación de este Dockerfile
- Opcionalmente, edita el Docker Compose según desees
- Ejecuta el siguiente comando para construir la imagen de Docker usando la versión `iron` de ROS2:

  1. Reconstruir la imagen **Sin cache**
  ```
  cd docker\kalman
  docker build --no-cache -t kalmanrobotics/kalman-kit:<NOMBRE_DEL_TAG> --build-arg distro_tag=<NOMBRE_DEL_TAG> .
  ```
  1. Reconstruir la imagen **Con cache**
  ```
  cd docker\kalman
  docker build  -t kalmanrobotics/kalman-kit:<NOMBRE_DEL_TAG> --build-arg distro_tag=<NOMBRE_DEL_TAG> .
  ```
- Una vez que la imagen se haya construido correctamente, puede etiquetarla y subirla a Docker Hub. Por ejemplo así: 
    ```
    docker push kalmanrobotics/kalman-kit:linux-latest
    # o
    docker push kalmanrobotics/kalman-kit:windows-latest
    ```

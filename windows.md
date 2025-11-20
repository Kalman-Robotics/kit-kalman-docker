## Install on Ubuntu or Windows PC using Docker
- If you are using a Windows PC, read this [blog post](https://kaia.ai/blog/local-pc-setup-windows/)
  - install [Windows WSL 2](https://learn.microsoft.com/en-us/windows/wsl/install)
  - install [Docker Desktop for Windows](https://docs.docker.com/desktop/install/windows-install/)
  - install [VcXsrv](https://sourceforge.net/projects/vcxsrv/), launch it and set display to `0` (zero)
- When using a Linux PC
  - install [Docker Engine](https://docs.docker.com/engine/install/ubuntu/) or
[Docker Desktop](https://docs.docker.com/desktop/install/linux-install/) (with GUI)

On Ubuntu you can run
```
git clone --depth 1 https://github.com/kalmanrobotics/kit-kalman-install
cd install/utils
source install_docker_on_ubuntu.sh
```

### Download Latest Pre-Built Image
  - Windows command line `docker pull kalmanrobotics/kit-kalman:humble`

### Run Kaia.ai (create a container)
- on Windows
  - open a command line window (or PowerShell or terminal)
  - `cd` to `docker\utils\`
  - launch container `.\create_container_iron.cmd`
  - open another command line window, `cd` to `docker\utils\`
  - launch an extra bash session `.\launch_bash.cmd`
  - be sure to install 


# Advanced - how to rebuild images


## Build all images - Windows
- install [Docker for Windows](https://docs.docker.com/desktop/install/windows-install/)
- clone the Kalman repo Docker repo and run the command below
```
git clone https://github.com/kalmanrobotics/kit-kalman-install
cd install\docker
.\utils\humble\build_iron.cmd
# .\utils\attest_humble.cmd
```


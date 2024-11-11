#!/bin/bash

#-----------------Actualizar la lista de paquetes
sudo apt update

#----------------------Remover las versiones existentes
sudo apt remove --purge -y vim tree ansible docker docker.io git lvm2

#------------------Limpiar paquetes no utilizados
sudo apt autoremove -y

#----------------Instalar las últimas versiones disponibles
sudo apt install -y vim tree ansible docker.io git lvm2

#----------------Iniciar el servicio de Docker
sudo systemctl start docker
sudo systemctl enable docker

#---------------Verificar las instalaciones
echo "Versiones instaladas:"
vim --version | head -n 1
tree --version
ansible --version
docker --version
git --version
lvm version


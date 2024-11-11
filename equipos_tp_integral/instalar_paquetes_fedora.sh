#!/bin/bash

#----------------Actualizar la lista de paquetes
sudo dnf update -y

#---------------------Remover las versiones existentes
sudo dnf remove -y vim tree ansible docker docker.io git lvm2

#----------------------Instalar las últimas versiones disponibles
sudo dnf install -y vim tree ansible docker git lvm2

#-----------------Iniciar el servicio de Docker
sudo systemctl start docker
sudo systemctl enable docker

#------------------------Verificar las instalaciones
echo "Versiones instaladas:"
vim --version | head -n 1
tree --version
ansible --version
docker --version
git --version
lvmdiskscan --version

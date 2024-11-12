
#!/bin/bash

#----------------------Crear volúmenes físicos
sudo pvcreate /dev/sdc1 /dev/sdd1


#----------------------Crear volumen de grupo para datos
sudo vgcreate vg_datos /dev/sdc1


#----------------------Crear y formatear volumen lógico para Docker
sudo lvcreate -L +10M vg_datos -n lv_docker
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_docker
echo '/dev/mapper/vg_datos-lv_docker /var/lib/docker ext4 defaults 0 0' | sudo tee -a /etc/fstab


#----------------------Crear y formatear volumen lógico para área de trabajo
sudo lvcreate -L +2.5G vg_datos -n lv_workareas
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_workareas
sudo mkdir -p /work
sudo mount /dev/mapper/vg_datos-lv_workareas /work/
echo '/dev/mapper/vg_datos-lv_workareas /work ext4 defaults 0 0' | sudo tee -a /etc/fstab



#----------------------Crear volumen de grupo para swap y volumen lógico de swap
sudo vgcreate vg_temp /dev/sdd1
sudo lvcreate -L +2.5G vg_temp -n lv_swap
sudo mkswap /dev/vg_temp/lv_swap
sudo swapon /dev/vg_temp/lv_swap
swapon --show #-------------------Verificar el swap activo
echo '/dev/vg_temp/lv_swap none swap sw 0 0' | sudo tee -a /etc/fstab

#--------------------Crear partición de swap en un disco independiente usando heredoc
sudo fdisk /dev/sde <<EOF
n                              #Crea una nueva partición
e                               #Elige una partición extendida
                                 #Acepta el valor predeterminado para el número de partición
                                  #Acepta el valor predeterminado para el primer sector
+1G                                #Define el tamaño de la partición en 1 GB
t                                   #Cambia el tipo de partición
82                                   #Establece el tipo de partición a 82 (Linux swap)
w                                     #Guarda los cambios y sale
EOF

#-----------------Formatear la nueva partición como swap y activarla
sudo mkswap /dev/sde1

sudo swapon /dev/sde1

#----------------Añadir la partición de swap a /etc/fstab para que sea persistente
echo '/dev/sde1 none swap sw 0 0' | sudo tee -a /etc/fstab

#--------------------------Confirmar que el swap ha sido añadido
swapon --show
cat /etc/fstab

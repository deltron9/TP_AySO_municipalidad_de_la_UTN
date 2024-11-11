# -*- mode: ruby -*- 
# vi: set ft=ruby : 

Vagrant.configure("2") do |config|    

#-----------------Definir la primera máquina virtual (Ubuntu) como 'testing'
  config.vm.define "testing" do |vmTesting|     
    vmTesting.vm.box = "ubuntu/jammy64"     
    vmTesting.vm.hostname = "testing"     
    vmTesting.vm.network "private_network", ip: "192.168.56.4"    

#-------------------Comparto la carpeta del host donde estoy parado contra la vm
    vmTesting.vm.synced_folder 'compartido_testing/', '/home/vagrant/compartido', 
    owner: 'vagrant', group: 'vagrant'  

#-----------Inserción de clave SSH
    vmTesting.ssh.insert_key = true      

    #---------Discos adicionales
    vmTesting.vm.disk :disk, size: "5GB", name: "#{vmTesting.vm.hostname}_disco1"     
    vmTesting.vm.disk :disk, size: "3GB", name: "#{vmTesting.vm.hostname}_disco2"     
    vmTesting.vm.disk :disk, size: "2GB", name: "#{vmTesting.vm.hostname}_disco3"     
    vmTesting.vm.disk :disk, size: "1GB", name: "#{vmTesting.vm.hostname}_disco4_extra"      

#----------------Configuración del proveedor VirtualBox
    vmTesting.vm.provider "virtualbox" do |vb|       
      vb.memory = "1024"       
      vb.name = "testing"       
      vb.cpus = 1       
      vb.linked_clone = true       
    end      

#---------------------Provisionamiento para ejecutar el script de Ubuntu
    vmTesting.vm.provision "shell", path: "instalar_paquetes_ubuntu.sh"
  end    

#------------Definir la segunda máquina virtual (Fedora) como 'produccion'   
  config.vm.define "produccion" do |vmProduccion|     
    vmProduccion.vm.box = "generic/fedora36"
    vmProduccion.vm.hostname = "produccion"     
    vmProduccion.vm.network "private_network", ip: "192.168.56.5"      

#--------------Comparto la carpeta del host donde estoy parado contra la vm
      vmProduccion.vm.synced_folder 'compartido_produccion/', '/home/vagrant/compartido'

#-----------------------------Inserción de clave SSH
    vmProduccion.ssh.insert_key = true      

#------------Discos adicionales
    vmProduccion.vm.disk :disk, size: "5GB", name: "#{vmProduccion.vm.hostname}_disco1"     
    vmProduccion.vm.disk :disk, size: "3GB", name: "#{vmProduccion.vm.hostname}_disco2"     
    vmProduccion.vm.disk :disk, size: "2GB", name: "#{vmProduccion.vm.hostname}_disco3"     
    vmProduccion.vm.disk :disk, size: "1GB", name: "#{vmProduccion.vm.hostname}_disco4_extra"      

#---------------------------------------Configuración del proveedor VirtualBox
    vmProduccion.vm.provider "virtualbox" do |vb|       
      vb.memory = "1024"       
      vb.name = "produccion"       
      vb.cpus = 1       
      vb.linked_clone = true       
    end      

#----------------------------------Provisionamiento para ejecutar el script de Fedora
    vmProduccion.vm.provision "shell", path: "instalar_paquetes_fedora.sh"
  end 
end


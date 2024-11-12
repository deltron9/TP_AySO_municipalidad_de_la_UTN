#!/bin/bash

#--------------------Agrego entradas al /etc/hosts
echo "192.168.56.4 testing" | sudo tee -a /etc/hosts > /dev/null
echo "192.168.56.5 produccion" | sudo tee -a /etc/hosts > /dev/null


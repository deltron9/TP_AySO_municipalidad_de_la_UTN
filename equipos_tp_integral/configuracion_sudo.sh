#!/bin/bash

#------------Permito que todos los usuarios usen sudo sin contraseña
echo "ALL ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/nopasswd_sudo > /dev/null


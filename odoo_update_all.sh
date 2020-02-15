#!/bin/bash
###############################################################################
# Script for updating Odoo on Ubuntu
# Author: Guillermo Castillo
# www.critean.com
#-------------------------------------------------------------------------------
# This script will update Odoo on your Ubuntu server.
#-------------------------------------------------------------------------------
# Use with sudo
# V0103   2020 01 21
################################################################################

#Start with SO
clear
  echo -e "\e[0;31mEmpezamos...\e[0m"
  echo
  echo

cd /
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y

#Update Odoo server
  echo
  echo -e "\e[0;33m Comenzamos a actualizar el servidor de Odoo ...\e[0m"
  echo
  echo

cd /opt/odoo/odoo-server
sudo git pull
cd ..

#start with addons-modules
  echo -e "\e[0;33m Vamos ahora actualizar los addons de Odoo ...\e[0m"
  echo
  echo
cd  /opt/odoo/custom/addons

cd hr-holidays/
sudo git pull
  echo
  echo -e "\e[0;32m Actualizado hr-holidays  \e[0m"
cd ..

cd l10n-spain/
sudo git pull
echo -e "\e[0;32m Actualizado l10n-spain  \e[0m"
cd ..

cd partner-contact/
sudo git pull
  echo -e "\e[0;32m Actualizado partner-contact  \e[0m"
cd ..

cd project/
sudo git pull
  echo -e "\e[0;32m Actualizado project  \e[0m"
cd ..

cd web/
sudo git pull
  echo -e "\e[0;32m Actualizado web  \e[0m"
cd ..

cd /community-data-files
sudo git pull
echo -e "\e[0;32m Actualizado community-data-files  \e[0m"
  echo
  echo -e "\e[0;33m Finalizada la actualización de los addons de Odoo ...\e[0m"
  echo
  echo

# Stop Odoo server
  echo -e "\e[0;33m Vamos a parar el servidor de Odoo ...\e[0m"

#sudo service odoo-server status
sudo systemctl stop odoo-server.service
  echo
#sudo service odoo-server stop
sudo systemctl status odoo-server.service
  echo
  echo
  echo -e "\e[0;33m Ahora vamos a actualizar la Base de Datos ...\e[0m"
  echo
  echo
  echo -e "\e[0;33m Espera por favor ...\e[0m"
cd /opt/odoo/odoo-server/
pwd
su - odoo -c "/opt/odoo/odoo-server/odoo-bin -d CRITEAN-PRODV13 -c /etc/odoo-server.conf -u all --stop-after-init"
  echo
  echo
#start odoo server
  echo -e "\e[0;33m Ahora arrancamos de nuevo todo ...\e[0m"
  echo
  echo
  echo -e "\e[0;33m LISTO !!!    \e[0m"

#sudo service odoo-server start
sudo systemctl start odoo-server.service
cd
  echo
  echo
  echo -e "\e[0;31mVolvemos al trabajo...\e[0m"

#!/bin/bash
###############################################################################
# Script for updating Odoo on Ubuntu
# Author: Guillermo Castillo
# www.critean.com
#-------------------------------------------------------------------------------
# This script will update Odoo on your Ubuntu server.
# Odoo V 13.0
#-------------------------------------------------------------------------------
# Use with sudo
# V0104   2020 06 10
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

cd community-data-files/
sudo git pull
echo -e "\e[0;32m Actualizado community-data-files  \e[0m"
cd ..
 
cd social/
sudo git pull
echo -e "\e[0;32m Actualizado social  \e[0m"
cd ..

cd website/
sudo git pull
echo -e "\e[0;32m Actualizado website  \e[0m"
cd ..

cd timesheet/
sudo git pull
echo -e "\e[0;32m Actualizado timesheet  \e[0m"
cd ..

cd account-financial-reporting/
sudo git pull
echo -e "\e[0;32m Actualizado account-financial-reporting  \e[0m"
cd ..

cd server-ux/
sudo git pull
echo -e "\e[0;32m Actualizado server-ux \e[0m"
cd ..

cd mis-builder/
sudo git pull
echo -e "\e[0;32m Actualizado mis-builder \e[0m"
cd ..

cd reporting-engine/
sudo git pull
echo -e "\e[0;32m Actualizado reporting-engine \e[0m"
cd ..

cd server-tools/
sudo git pull
echo -e "\e[0;32m Actualizado server-tools \e[0m"
cd ..

cd hr-attendance/
sudo git pull
echo -e "\e[0;32m Actualizado hr-attendance \e[0m"
cd ..

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

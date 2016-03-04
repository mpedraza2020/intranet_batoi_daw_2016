#!/bin/bash
# CREAR BASE DATOS + DATOS
clear
echo "***********************************************"
echo "****  BACKUP BASE DE DATOS INTRANET BATOI  ****"
echo "***********************************************"
echo " "
echo "Introduzca el usuario con permisos de root para acceder a MYSQL"
read USUARIO
echo " "
echo "Introduzca el password de $USARIO para acceder a MYSQL"
read PASS
echo " "
# Obtener fecha y hora
FECHAHORA=$(date +%Y%m%d_%H:%M:%S)
#-----------------------------------------------
# crear el backup de la base de datos
# ESTRUCTURA DE LA BASE DE DATOS Y SUS DATOS
mysqldump -u $USUARIO -p$PASS --databases IntranetBatoi > $FECHAHORA"_IntranetBatoi_DB_DATA.bak"
#mysqldump -u $USUARIO -p$PASS --databases IntranetBatoi > $FECHAHORA"backup_IntranetBatoi_DB_DATA.sql"

# SOLO ESTRUCTURA DE LA BASE DE DATOS
mysqldump -d -u $USUARIO -p$PASS -d IntranetBatoi > $FECHAHORA"_IntranetBatoi_DB.bak"
#mysqldump -d -u $USUARIO -p$PASS -d IntranetBatoi > $FECHAHORA"_IntranetBatoi_DB.sql"

# SOLO LOS DATOS
mysqldump -t -u $USUARIO -p$PASS -t IntranetBatoi > $FECHAHORA"_IntranetBatoi_DATA.bak"
#mysqldump -t -u $USUARIO -p$PASS -t IntranetBatoi > $FECHAHORA"_IntranetBatoi_DATA.sql"

echo " "
echo " ---------------------------------- "
echo "    Backup - Proceso finalizado     "
echo " ---------------------------------- "

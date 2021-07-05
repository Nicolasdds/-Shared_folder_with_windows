#! /bin/bash
clear
echo "Montar servicio en /mnt para acceder a recursos."
echo "Protocolos Requeridos: Ssh: 22 | Rpcbind: 111 | Nfs: 2049."
echo "Verificando Servicios... espere porfavor."
echo ""
open=$(nmap -p 22,111,2049 $1 | grep open | wc -l)
if
  [ $open -eq 3 ]
then
  echo -e  "\e[5;32m             ***SERVICIO HABILITADO*** \e[0m"
  echo ""
  read -p "Ingrese un ID para el recurso: " recurse
  mkdir -p /mnt/$recurse/
  mount -t nfs $1:/ /mnt/$recurse -o nolock
  clear 
  echo -e  "\e[5;32m             ***RECURSO MONTADO*** \e[0m"
  df -h
else
  echo -e  "\e[5;31m           ***SERVICIO NO HABILITADO*** \e[0m"

fi



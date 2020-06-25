#!/bin/bash
### BEGIN INIT INFO
# Provides:          atualizar.sh
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Update, fixes
# Description:       Complete system upgrade, clean unnecessary packages, remove only old or duplicate packages.
### END INIT INFO



clear
echo
echo "Limpando o cache das Atualizacoes............................................................";
echo
################# Baixando e Instalando Atualizações ###############################
sudo apt-get clean -y
echo
echo "Cache das Atualizacoes Limpo...........................................................[ OK ]";
echo
sleep 3

echo
echo "Atualizar Base dados das Atualizacoes........................................................";
echo
####################### Atualizar Base dados #######################################
sudo apt-get update
echo
echo "Base de dados Atualizadas..............................................................[ OK ]";
echo
sleep 3


echo
echo "Corrigindo Problemas com dependencias........................................................";
echo
################# Corrigindo Problemas com dependencias ############################
sudo apt-get install -f -y
echo
echo "Problemas com dependencias Corrigindos.................................................[ OK ]";
echo
sleep 3



echo
echo "Reparando Problemas..........................................................................";
echo
################# Corrigindo Problemas com dependencias ############################
sudo dpkg --configure -a
sudo apt --fix-broken install
echo
echo "Problemas Reparados....................................................................[ OK ]";
echo
sleep 3



echo
echo "Baixando e Instalando as Atualizacoes........................................................";
echo
################# Baixando e Instalando Atualizações ###############################
sudo apt-get upgrade -f -y
echo
echo "Atualizacoes Instaladas................................................................[ OK ]";
echo
sleep 3


echo
echo "Baixando e Instalando Atualizacoes das distribuicoes.........................................";
echo
################# Baixando e Instalando Atualizações ###############################
sudo apt-get dist-upgrade -f -y
sudo apt-get full-upgrade -f -y
echo
echo "Atualizacoes das distribuicoes Instaladas..............................................[ OK ]";
echo
sleep 3

echo
echo "Verificando pacotes antigos ou duplicados....................................................";
echo
################# Baixando e Instalando Atualizações ###############################
sudo apt-get autoclean -y
echo
echo "Pacotes antigos ou duplicados removidos................................................[ OK ]";
echo
sleep 3


echo
echo "Procurando pacotes desnecessarios............................................................";
echo
################# Baixando e Instalando Atualizações ###############################
sudo apt-get autoremove -f -y
echo
echo "Pacotes desnecessario Removidos........................................................[ OK ]";
echo
sleep 3 


echo
echo "Atualizar Base de dados Antivirus Clamav.....................................................";
echo
################# Atualizar Base dados Antivirus Clamav ###############################
sudo /etc/init.d/clamav-freshclam stop
sudo /usr/bin/freshclam -v
sudo /etc/init.d/clamav-freshclam start
echo
echo "Base de dados Antivirus Clamav Atualizada..............................................[ OK ]";
echo
echo "Saindo..."
sleep 3

exit 0

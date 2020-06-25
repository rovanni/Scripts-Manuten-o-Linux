#!/bin/bash
clear
echo
echo "Atualizar Base de dados Antivirus Clamav................................................";
echo
################# Atualizar Base dados Antivirus Clamav ###############################
sudo /etc/init.d/clamav-freshclam stop
sudo /usr/bin/freshclam -v
sudo /etc/init.d/clamav-freshclam start
echo
echo "Atualizar Base dados concluida....................................................[ OK ]";
echo
sleep 3 

echo
echo "Duvidas de comandos do Clamscan digite: clamscan --help.................................";
echo "Verificando e removendo virus da pasta home. Por Favor Aguarde!!!.......................";
echo
####################### Verificar e remover virus hd ###############################
sudo chmod -R 777 /var/log/clamav/		#Permissão de gravar na pasta
echo >>/var/log/clamav/relscan.log		#Grava um espaço em branco dentro arquivo
echo >>----------- Relatório de Verificação de Vírus ----------- >>/var/log/clamav/relscan.log	#Grava cabeçalho
echo >>/var/log/clamav/relscan.log		#Grava um espaço em branco dentro arquivo
data=`date +%d/%m/%Y-%H:%M:%S`			#Armazena dia e hora na variavel data
echo Verificado dia: ${data}  >>/var/log/clamav/relscan.log	#Grava data atual dentro arquivo
echo >>/var/log/clamav/relscan.log		#Grava um espaço em branco dentro arquivo
sudo clamscan -r --bell --remove=yes -i --detect-pua=yes /home/ >> /var/log/clamav/relscan.log	#Verifica e remove os virus e grava o relatoria dentro do arquivo
echo
echo "Verificação concluida com sucesso.................................................[ OK ]";
echo
sleep 3 

echo
####################### Verificar e remover virus hd ###############################
echo
echo "Relatorio gerado em: /var/log/clamav/relscan.log..................................[ OK ]";
cat /var/log/clamav/relscan.log
echo
echo
echo "Saindo..."
sleep 10 

exit 0

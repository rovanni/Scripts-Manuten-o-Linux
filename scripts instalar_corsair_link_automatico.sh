#!/bin/bash
x="opt"
menu ()
{
while true $x != "opt"
do
clear
echo "================================================"
echo "Script para ajudar na Instalação!"
echo "Criado por: Luciano R.N."
echo ""
echo "Primeiro copie a pasta 'hidapi' para pasta pessoal para ficar assim: '/home/luciano/hidapi/'"
echo "Semente apos copiar seleciona a opção 1."
echo ""
echo "1)Instalação automatica, sera feita as seguintes etapas:"
echo "Modificar permissão na pasta /home/luciano/hidapi/"
echo "Instalar as bibliotecas e prog. necessários: libudev, libusb 1.0, libhidap-hidraw0 e g++"
echo "Instalar Drivers necessários"
echo "Instalar CorsairLink"
echo ""
echo "2)Sair do programa"
echo ""
echo "================================================"

echo "Digite a opção desejada:"
read x
echo "Opção informada ($x)"
echo "================================================"

case "$x" in

	1)
		echo "================================================"	
		echo "Instalando por favor aguarde..."
		sudo chmod -R 777 /home/luciano/hidapi/
		sudo apt-get update && sudo apt-cache madison libudev-dev && sudo apt-cache madison libudev1 && sudo apt-get install libudev-dev -y && sudo apt-get install libusb-1.0-0-dev -y && sudo apt-get install libhidapi-hidraw0 -y && sudo apt-get install g++ -y		
		sudo apt-get install autotools-dev autoconf automake libtool git qt5-default -y && cd ~/hidapi && ./bootstrap && ./configure && make		
		cd OpenCorsairLink && git submodule init && git submodule update && qmake OpenCorsairLink.pro && make && sudo ldconfig		
		sleep 5
		echo ""				
		echo "Instalando concluida!"
		echo "================================================"		
		sleep 10		
		
echo "================================================"
;;
	2)
		echo "saindo..."
		sleep 5
		clear;
		exit;
echo "================================================"
;;

*)
        echo "Opção inválida!"
esac
done

}
menu

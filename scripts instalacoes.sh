#!/bin/bash
x="teste"
menu ()
{
while true $x != "teste"
do
clear
echo "================================================"
echo "Script para ajudar na Instalação!"
echo "Criado por: Luciano R.N."
echo ""
echo "1)Instalar Squid e Bind (Cache Internet)"
echo ""
echo "2)Instalar Lamp server"
echo ""
echo "3)Instalando Latex - Texlive-Full Texstudio e Jabref..."
echo ""
echo "4)Instalar Latex - Texlive, Texstudio e Jabref..."
echo ""
echo "5)Instalar Notepadqq"
echo ""
echo "6)Instalar Antivirus Clamav"
echo ""
echo "7)Instalar Firewall Gufw"
echo ""
echo "8)Instalar 7zip"
echo ""
echo "9)Instalar Protetor de tela"
echo ""
echo "10)Instalar Grub Customizer"
echo ""
echo "11)Instalar NTP para sincronizador do relógio"
echo ""
echo "12)Instalar leidor de Digitais - Fingerprint GUI"
echo ""
echo "13)Instalar Dropbox"
echo ""
echo "14)Instalar Chromium"
echo ""
echo "15)Programa Backup SystemBack"
echo ""
echo "16)Reparar erros"
echo ""
echo "17)Limpar Programas e Dependencias Desnecessarias"
echo ""
echo "18)Instalar Driver Nvidia"
echo ""
echo "19)Instalar Gerenciador Bluetooth"
echo ""
echo "20)Instalar Gerenciador de pacotes Synaptic"
echo ""
echo "21)Reiniciar"
echo ""
echo "22)Sair do programa"
echo ""
echo "================================================"

echo "Digite a opção desejada:"
read x
echo "Opção informada ($x)"
echo "================================================"

case "$x" in

	1)
		echo "Instalando Squid e Bind..."
		sudo apt-get update && sudo apt-get install bind9 bind9utils bind9-doc -y
		sudo apt-get install squid -y
		echo ""
		echo "Squid e Bind Instalados!"
		sleep 5
echo "================================================"
;;
	2)
		echo "Instalando Apache, Mysql, Php..."
		sudo apt-get update && sudo apt-get install lamp-server^ -y
		echo ""
		echo "Apache, Mysql, Php Instalados!"
		sleep 5
echo "================================================"
;;
	3)
		echo "Instalando Latex - Texlive-base Texstudio e Jabref..."
		sudo apt-get update && sudo apt install texlive-full -y
		sudo apt-get install texstudio -y
		sudo apt-get install jabref -y
		echo ""
		echo "Latex Instalado!"
		sleep 5

echo "================================================"
;;
	4)
		echo "Instalando Latex - Texlive Texstudio e Jabref..."
		sudo apt-get update && sudo apt install texlive -y
		sudo apt-get install texstudio -y
		sudo apt-get install jabref -y
		echo ""
		echo "Latex Instalado!"
		sleep 5

echo "================================================"
;;
	5)
		echo "Instalando Notepadqq..."
		sudo apt-get update
		sudo apt-get install notepadqq -y
		echo ""
		echo "Notepadqq Instalado!"
		sleep 5
echo "================================================"
;;
	6)
		echo "Instalando Antivirus..."
		sudo apt-get update && sudo apt-get install clamav clamav-daemon clamav-freshclam clamtk -y
		sudo /etc/init.d/clamav-freshclam stop
		sudo /usr/bin/freshclam -v
		sudo /etc/init.d/clamav-freshclam start		
		echo ""
		echo "Antivirus Instalado!"
		sleep 5
echo "================================================"
;;
	7)
		echo "Instalando Firewall"
		sudo apt-get update && sudo apt-get install gufw -y
		echo ""
		echo "Firewall Instalado!"
		sleep 5
echo "================================================"
;;
	8)
		echo "Instalando 7zip..."
		sudo apt-get install p7zip p7zip-full p7zip-rar lzma lzma-dev -y
		echo ""
		echo "7zip Instalado!"
		sleep 5
echo "================================================"
;;

	9)
		echo "Instalando Proteção de Tela..."
		sudo apt-get update && sudo apt-get install xscreensaver xscreensaver-data xscreensaver-data-extra xscreensaver-gl xscreensaver-gl-extra -y
		echo ""
		echo "Proteção de Tela Instalado!"
		sleep 5
echo "================================================"
;;

	10)
		echo "Instalando grub-customizer..."
        sudo apt-get install software-properties-common -y
		sudo apt-get update && sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
		sudo apt-get update
		sudo apt-get install grub-customizer -y
		echo ""
		echo "Grub-customizer Instalado!"
		sleep 5


echo "================================================"
 ;;

	11)
		echo "Instalando NTP para sincronizador do relógio..."
		sudo apt-get update
		sudo apt-get install ntp ntpdate -y
		echo ""
		echo "NTP Instalado!"

echo "================================================"
 ;;

	12)
		echo "Instalando Fingerprint GUI..."
        sudo apt-get install software-properties-common -y		
		sudo add-apt-repository ppa:fingerprint/fingerprint-gui -y
		sudo apt-get update
		sudo apt-get install libbsapi policykit-1-fingerprint-gui fingerprint-gui -y
		echo ""
		echo "Fingerprint GUI Instalado!"

echo "================================================"
;;
	13)
		echo "Instalar o Chromium..."
		sudo apt-get update
		sudo apt-get install chromium-browser -y
		echo ""
		echo "Chromium Instalado!"
		sleep 5

echo "================================================"
;;
	14)
		echo "Instalar o Dropbox..."
		sudo apt-get update
		sudo rm -Rf /opt/dropbox*
		sudo rm -Rf /usr/bin/dropbox
		sudo rm -Rf /usr/share/applications/dropbox.desktop
		wget "http://www.dropbox.com/download/?plat=lnx.x86_64" -O dropbox.tar.gz
		sudo tar -xvf dropbox.tar.gz -C /opt/
		sudo mv /opt/.dropbox-dist/ /opt/dropbox
		sudo ln -sf /opt/dropbox/dropboxd /usr/bin/dropbox
		echo -e '[Desktop Entry]\n Version=1.0\n Name=dropbox\n Exec=/opt/dropbox/dropboxd\n Icon=/ \n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/dropbox.desktop
		sudo chmod +x /usr/share/applications/dropbox.desktop
		cp /usr/share/applications/dropbox.desktop  ~/Área\ de\ Trabalho/
		cp /usr/share/applications/dropbox.desktop ~/Desktop
		echo ""
		echo "Dropbox Instalado!"
		sleep 5

echo "================================================"
 ;;
	15)
		echo "Programa Backup SystemBack..."
		sudo apt-add-repository ppa:nemh/systemback -y
		sudo apt-get update
		sudo apt-get install systemback -y
		echo ""
		echo "SystemBack Instalado!"
		sleep 2

echo "================================================"
 ;;
	16)
		echo "Reparando..."
		sudo apt-get install -f -y
		sudo dpkg --configure -a
		echo ""
		echo "Erros Corrigidos!"
		sleep 2

echo "================================================"
;;
	17)
		echo "Limpamdo..."
		sudo apt-get autoclean -y
		sudo apt-get autoremove -f -y
		sudo apt-get clean -y
		echo ""
		echo "Programas e Dependencias Desnecessarias removidas!"
		sleep 5
		
echo "================================================"
;;		
		
	18)
		echo "Instalando Driver Nvidia..."
		sudo apt-get update
		sudo apt-get install console-setup -y
		sudo apt-get install nvidia-driver -y
		echo ""
		echo "Driver Nvidia Instalado!"
		sleep 5
		
echo "================================================"
 ;;
 
 	19)
		echo "Instalando Gerenciador Bluetooth..."
		sudo apt-get update
		sudo apt install bluez-* -y
		sudo apt install blueman -y
		echo ""
		echo "Gerenciador Bluetooth Instalado!"
		sleep 5
		
echo "================================================"
 ;;
 
 	20)
		echo "Instalando Gerenciador de pacotes Synaptic..."
		sudo apt-get update
		sudo apt-get install synaptic
		echo ""
		echo "Gerenciador de pacotes Synaptic Instalado!"
		sleep 5


echo "================================================"
 ;;
 
	21)
		reboot
		exit;
echo "================================================"
;;

	22)
		echo "Saindo..."
		sleep 2
		clear;
		exit 1		
echo "================================================"
;;



*)
        echo "Opção inválida!"
esac
done

}
menu

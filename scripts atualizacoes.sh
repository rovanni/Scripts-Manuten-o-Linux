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

# Criado por: Luciano R.N.

function pause(){
    ###################################################################
    # Função para criar uma pausa
    ###################################################################
    read -s -n 1 -p "Pressione qualquer tecla para continuar . . ."
    echo ""
}

clear
echo
echo "Atualizando o sistema..."
echo

# Atualizar a base de dados antes de limpar o cache
echo "Atualizando a base de dados de pacotes..."
sudo apt-get update
echo "Base de dados atualizada. [OK]"
sleep 1

# Limpando o cache
echo "Limpando o cache de pacotes..."
sudo apt-get clean -y
echo "Cache limpo. [OK]"
sleep 1

# Corrigir pacotes quebrados
echo "Corrigindo problemas de dependências..."
sudo apt-get install -f -y
sudo dpkg --configure -a
sudo apt --fix-broken install
echo "Problemas corrigidos. [OK]"
sleep 1

# Atualizar pacotes do sistema
echo "Baixando e instalando atualizações..."
sudo apt-get upgrade -y
echo "Atualizações instaladas. [OK]"
sleep 1

# Atualizar distribuição
echo "Baixando e instalando atualizações da distribuição..."
sudo apt-get dist-upgrade -y
echo "Atualizações da distribuição instaladas. [OK]"
sleep 1

# Remover pacotes desnecessários e antigos
echo "Removendo pacotes antigos e desnecessários..."
sudo apt-get autoremove -y
sudo apt-get autoclean -y
echo "Pacotes removidos. [OK]"
sleep 1

# Atualizar Snap
echo "Atualizando Snap Store e aplicativos Snap..."
sudo killall snap-store
sudo snap refresh
echo "Atualizações do Snap concluídas. [OK]"
sleep 1

# Atualizar ClamAV
echo "Atualizando banco de dados do ClamAV..."
sudo systemctl stop clamav-freshclam
sudo freshclam
sudo systemctl start clamav-freshclam
echo "Banco de dados do ClamAV atualizado. [OK]"
sleep 1

echo "Atualização concluída!"
pause
exit 0

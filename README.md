# System Update and Maintenance Script

A bash script to automate system updates, cleanup, and maintenance tasks on Debian-based systems.

## Overview
This script performs a comprehensive system update, including package upgrades, dependency fixes, cache cleanup, Snap updates, and ClamAV database updates. It can be run manually or configured as a service.

## Features
- Updates package databases.
- Fixes broken dependencies.
- Upgrades system packages and distribution.
- Removes old/unnecessary packages.
- Cleans package cache.
- Updates Snap applications.
- Updates ClamAV virus database.
- Interactive pause before exiting.

## Installation
1. Download the script:
   ```bash
   sudo wget -O /usr/local/bin/update_system.sh https://raw.githubusercontent.com/rovanni/repo/main/update_system.sh
   sudo wget -O /usr/local/bin/update_system_en.sh https://raw.githubusercontent.com/rovanni/repo/main/update_system_en.sh

   # Script de atualização e manutenção do sistema

# Um script bash para automatizar atualizações do sistema, limpeza e tarefas de manutenção em sistemas baseados em Debian.

## Visão geral
Este script executa uma atualização abrangente do sistema, incluindo atualizações de pacotes, correções de dependências, limpeza de cache, atualizações do Snap e atualizações do banco de dados ClamAV. Ele pode ser executado manualmente ou configurado como um serviço.

## Recursos
- Atualiza bancos de dados de pacotes.
- Corrige dependências quebradas.
- Atualiza pacotes e distribuição do sistema.
- Remove pacotes antigos/desnecessários.
- Limpa o cache de pacotes.
- Atualiza aplicativos Snap.
- Atualiza o banco de dados de vírus ClamAV.
- Pausa interativa antes de sair.

## Instalação
1. Baixe o script:
```bash
   sudo wget -O /usr/local/bin/update_system.sh https://raw.githubusercontent.com/rovanni/repo/main/update_system.sh
   sudo wget -O /usr/local/bin/update_system_en.sh https://raw.githubusercontent.com/rovanni/repo/main/update_system_en.sh

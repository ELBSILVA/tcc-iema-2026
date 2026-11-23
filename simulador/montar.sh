#!/bin/bash
# Monta a pasta do simulador e o zip (usado pelo GitHub Actions e para teste local)
set -e
BUILD=${1:-0}; DATA=${2:-$(date +%d/%m/%Y)}
D=dist/Simulador_TCC_IEMA_2026
rm -rf dist; mkdir -p $D
cp -r organiza stocktech ecofood $D/
cp Logo_IEMA_Organiza.png Logo_StockTech.png Logo_EcoFood.png $D/
cp organiza/logo_iema.png $D/
sed -e "s|__BUILD__|$BUILD|" -e "s|__DATA__|$DATA|" simulador/ABRIR_SIMULADOR.html > $D/ABRIR_SIMULADOR.html
cp simulador/LEIA-ME.txt $D/
(cd dist && zip -qr Simulador_TCC_IEMA_2026.zip Simulador_TCC_IEMA_2026)
ls -la dist

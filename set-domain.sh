#!/bin/sh
# Uso: ./set-domain.sh https://www.tuodominio.it   (senza slash finale)
[ -z "$1" ] && { echo "Uso: $0 https://www.tuodominio.it"; exit 1; }
sed -i "s|__SITE_URL__|${1%/}|g" index.html privacy.html robots.txt sitemap.xml
echo "Dominio impostato su ${1%/}"

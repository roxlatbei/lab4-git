#!/bin/bash
#
# skrypt.sh - skrypt pomocniczy do cwiczenia "Podstawowa praca z GIT"
# Autor: Ggg
#

SCRIPT_NAME=$(basename "$0")
TODAY=$(date +"%Y-%m-%d")

if [ $# -eq 0 ]; then
    echo "Brak argumentow. Uzyj --help aby zobaczyc dostepne opcje."
    exit 0
fi

case "$1" in
    *)
        echo "Nieznana opcja: $1"
        exit 1
        ;;
esac
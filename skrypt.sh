#!/bin/bash
#
# skrypt.sh - skrypt pomocniczy do cwiczenia "Podstawowa praca z GIT"
# Autor: Ggg
#

SCRIPT_NAME=$(basename "$0")
TODAY=$(date +"%Y-%m-%d")

show_date() {
    echo "Dzisiejsza data: $TODAY"
}

create_logs() {
    local count=100
    for ((i = 1; i <= count; i++)); do
        local filename="log${i}.txt"
        {
            echo "Nazwa pliku: $filename"
            echo "Utworzony przez skrypt: $SCRIPT_NAME"
            echo "Data utworzenia: $TODAY"
        } > "$filename"
    done
    echo "Utworzono $count plikow logow."
}

if [ $# -eq 0 ]; then
    echo "Brak argumentow. Uzyj --help aby zobaczyc dostepne opcje."
    exit 0
fi

case "$1" in
    --date)
        show_date
        ;;
    --logs)
        create_logs
        ;;
    *)
        echo "Nieznana opcja: $1"
        exit 1
        ;;
esac
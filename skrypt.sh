#!/bin/bash
#
# skrypt.sh - skrypt pomocniczy do cwiczenia "Podstawowa praca z GIT"
# Autor: Ggg
#

SCRIPT_NAME=$(basename "$0")
TODAY=$(date +"%Y-%m-%d")

show_help() {
    echo "Uzycie: $SCRIPT_NAME [OPCJA] [ARGUMENT]"
    echo ""
    echo "Dostepne opcje:"
    echo "  --date              Wyswietla dzisiejsza date"
    echo "  --logs [N]          Tworzy N plikow logX.txt (domyslnie 100)"
    echo "  --help              Wyswietla ta pomoc"
}

show_date() {
    echo "Dzisiejsza data: $TODAY"
}

create_logs() {
    local count=${1:-100}
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
    show_help
    exit 0
fi

case "$1" in
    --date)
        show_date
        ;;
    --logs)
        create_logs "$2"
        ;;
    --help)
        show_help
        ;;
    *)
        echo "Nieznana opcja: $1"
        show_help
        exit 1
        ;;
esac
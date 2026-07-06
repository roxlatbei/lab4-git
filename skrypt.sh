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
    echo "  --date, -d              Wyswietla dzisiejsza date"
    echo "  --logs [N], -l [N]      Tworzy N plikow logX.txt (domyslnie 100)"
    echo "  --help, -h              Wyswietla ta pomoc"
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

create_errors() {
    local count=${1:-100}
    for ((i = 1; i <= count; i++)); do
        local dirname="error${i}"
        local filename="${dirname}/error${i}.txt"
        mkdir -p "$dirname"
        {
            echo "Nazwa pliku: error${i}.txt"
            echo "Utworzony przez skrypt: $SCRIPT_NAME"
            echo "Data utworzenia: $TODAY"
        } > "$filename"
    done
    echo "Utworzono $count katalogow error."
}

do_init() {
    read -rp "Podaj adres URL repozytorium do sklonowania: " repo_url
    if [ -z "$repo_url" ]; then
        echo "Nie podano adresu repozytorium."
        exit 1
    fi
    git clone "$repo_url" .
    export PATH="$PATH:$(pwd)"
    echo "export PATH=\"\$PATH:$(pwd)\"" >> "$HOME/.bashrc"
    echo "Repozytorium sklonowane, katalog dodany do PATH."
}

if [ $# -eq 0 ]; then
    show_help
    exit 0
fi

case "$1" in
    --date|-d)
        show_date
        ;;
    --logs|-l)
        create_logs "$2"
        ;;
    --error|-e)
        create_errors "$2"
        ;;
    --init)
        do_init
        ;;
    --help|-h)
        show_help
        ;;
    *)
        echo "Nieznana opcja: $1"
        show_help
        exit 1
        ;;
esac
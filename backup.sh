#!/bin/bash
set -Eeuo pipefail
source_dir="data/"
backup_dir="backups"
date=$(date +%Y-%m-%d_%H-%M-%S)
mkdir -p "$backup_dir"

if [ ! -d "$source_dir" ]; then
    echo "Erreur : Le dossier source $source_dir n'existe pas !" >&2
    exit 1
fi

tar -czf "$backup_dir/backup_$date.tar.gz" "$source_dir"

for fichier in $(find "$backup_dir" -type f -name "backup_*.tar.gz" -mtime +7); do
	rm "$fichier"
done

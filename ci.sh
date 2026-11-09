#!/bin/bash
set -Eeuo pipefail

log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a ci_pipeline.log
}

if [ -z "${1:-}" ]; then
	log_message "Erreur : Passez l'URL du dépôt en argument"
	exit 1
fi

log_message "Récupération du code source ..."

if [ ! -d "workspace" ]; then
	git clone "$1" workspace
else
	git -C workspace pull
fi

log_message "Exécution des tests ..."

if [ -f "workspace/README.md" ]; then
	log_message "Succès : Test validé"
	exit 0
else
	log_message "Echec : Fichier README.md manquant"
	exit 1
fi

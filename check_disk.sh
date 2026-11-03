#!/bin/bash
SEUIL=${1:-80}
USAGE=$(df / | tail -n 1 | awk '{print $5}' | tr -d '%')

if [ "$USAGE" -ge "$SEUIL" ]; then
    echo "ALERTE : L'espace disque utilisé ($USAGE%) dépasse le seuil autorisé ($SEUIL%) !"
    exit 1
else
    echo "Statut OK : L'espace disque utilisé ($USAGE%) est sous le seuil ($SEUIL%)."
    exit 0
fi

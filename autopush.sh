#!/bin/bash

echo "🚀 Autopush iniciado en $(pwd)"
echo "Presiona Ctrl+C para detener"

# Escuchar cambios con fswatch
fswatch -o . | while read change
do
    # Solo si hay cambios
    if [[ -n $(git status --porcelain) ]]; then
        git add .
        git commit -m "Auto commit on $(date '+%Y-%m-%d %H:%M:%S')"
        git push origin main
        echo "✅ Cambios subidos a GitHub en $(date)"
    fi
done
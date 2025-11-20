#!/bin/bash
set -e

echo "=== Update sistem ==="
sudo apt update && sudo apt upgrade -y

echo "=== Install paket dari packages.txt ==="
if [ -f "packages.txt" ]; then
    xargs -a packages.txt sudo apt install -y
else
    echo "packages.txt tidak ditemukan, lewati..."
fi

echo "=== Enable power & thermal management ==="
sudo systemctl enable tlp || true
sudo systemctl enable thermald || true

echo "=== Selesai! ==="

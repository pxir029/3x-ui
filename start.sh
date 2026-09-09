#!/bin/bash
set -e
export PORT="${PORT:-8080}"

echo "=========================================="
echo " 3x-ui SOURCE BUILD (custom login)"
echo " PORT = ${PORT}"
echo "=========================================="

mkdir -p /etc/x-ui /var/log/x-ui
cd /app

./x-ui setting -port "${PORT}" || true
./x-ui setting -listenIP "0.0.0.0" || true
./x-ui setting -webBasePath "/" || true

echo "----- Settings -----"
./x-ui setting -show true || true
echo "--------------------"

echo "Starting x-ui..."
exec ./x-ui

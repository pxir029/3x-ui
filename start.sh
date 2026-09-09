#!/bin/bash
set -e

# Railway همیشه PORT را ست می‌کند. اگر نبود 8080
export PORT="${PORT:-8080}"

echo "=========================================="
echo " 3x-ui Railway Starter"
echo " PORT = ${PORT}"
echo "=========================================="

mkdir -p /etc/x-ui /var/log/x-ui
cd /usr/local/x-ui

# ۱. اول پورت و listen را تنظیم کن (قبل از استارت اصلی)
./x-ui setting -port "${PORT}" || true
./x-ui setting -listenIP "0.0.0.0" || true
./x-ui setting -webBasePath "/" || true

echo "----- Settings after apply -----"
./x-ui setting -show true || true
echo "--------------------------------"

echo "Starting x-ui on 0.0.0.0:${PORT} ..."
# اجرا در پیش‌زمینه با exec تا PID 1 باشد
exec ./x-ui

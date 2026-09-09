#!/bin/bash
set -e

PORT="${PORT:-2053}"

echo "========================================"
echo "🚀 3x-ui starting on Railway"
echo "   PORT = $PORT"
echo "========================================"

mkdir -p /etc/x-ui /var/log/x-ui

cd /usr/local/x-ui

# تنظیم پورت و listen روی همه اینترفیس‌ها
# این دستور قبل از اولین اجرا تنظیمات را در دیتابیس می‌نویسد
./x-ui setting -port "$PORT" -listenIP "0.0.0.0" 2>/dev/null || true
./x-ui setting -webBasePath "/" 2>/dev/null || true

# نمایش تنظیمات فعلی برای دیباگ
echo "----- Current settings -----"
./x-ui setting -show true 2>/dev/null || true
echo "----------------------------"

echo "Starting x-ui process..."
exec ./x-ui

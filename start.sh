#!/bin/bash
set -e

PORT=${PORT:-2053}

echo "🚀 Starting 3x-ui on port $PORT ..."

mkdir -p /etc/x-ui

# تنظیم پورت پنل برای Railway
/usr/local/x-ui/x-ui setting -port "$PORT" -webBasePath "/" || true

# اجرای پنل
cd /usr/local/x-ui
exec ./x-ui

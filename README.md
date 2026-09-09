# 3x-ui روی Railway (نسخه پایدار)

## مراحل دیپلوی

1. این ۴ فایل را در **روت** ریپازیتوری فورک‌شده بگذار:
   - Dockerfile
   - start.sh
   - railway.toml
   - .dockerignore

2. Push کن و در Railway از GitHub Deploy کن.

3. **خیلی مهم - تنظیم Target Port:**
   - Settings → Networking
   - روی دامنه Edit بزن
   - **Target Port** را دقیقاً روی عددی بگذار که در لاگ نوشته (`PORT = ....`)
   - معمولاً `8080` است
   - ذخیره کن

4. Volume بساز:
   - Mount Path: `/etc/x-ui`

## ورود
- آدرس: دامنه Railway
- یوزر / پسورد پیش‌فرض: `admin` / `admin` (فوری عوض کن)

## اگر 502 گرفتی
Target Port را با عدد PORT در لاگ یکی کن. این شایع‌ترین دلیل 502 است.

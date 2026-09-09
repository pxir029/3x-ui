# راهنمای دیپلوی ۳x-ui (سنایی) روی Railway

## فایل‌های لازم
این فایل‌ها را در **روت** ریپازیتوری فورک‌شده خود قرار دهید:

- `Dockerfile`
- `start.sh`
- `railway.toml`
- `.dockerignore` (اختیاری)

## مراحل دیپلوی

1. فایل‌های بالا را به روت پروژه فورک‌شده اضافه کنید و push کنید.
2. وارد [Railway.app](https://railway.app) شوید.
3. New Project → Deploy from GitHub repo → فورک خود را انتخاب کنید.
4. بعد از دیپلوی موفق:
   - Settings → Networking → Generate Domain
5. پنل در آدرس زیر در دسترس است:
   ```
   https://your-app.up.railway.app
   ```

## نکات مهم

- یوزر و پسورد پیش‌فرض معمولاً `admin` / `admin` است. **فوری عوض کنید**.
- برای حفظ دیتابیس بعد از ریستارت، یک Volume بسازید و به مسیر `/etc/x-ui` مانت کنید.
- برای اینباندهای Reality / gRPC / TCP از **TCP Proxy** در Railway استفاده کنید.
- اگر نسخه جدید ۳x-ui منتشر شد، مقدار `XUI_VERSION` داخل Dockerfile را آپدیت کنید.

## لینک‌های مفید
- ریپوی اصلی: https://github.com/mhsanaei/3x-ui
- ریلیزها: https://github.com/mhsanaei/3x-ui/releases

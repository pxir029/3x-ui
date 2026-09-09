# رفع خطای Application failed to respond

## کارهای ضروری بعد از دیپلوی

### ۱. تنظیم Target Port در Railway
1. برو به سرویس خودت در Railway
2. **Settings → Networking**
3. روی دامنه کلیک کن یا Edit بزن
4. **Target Port** را روی همان پورتی بگذار که در لاگ نوشته شده (معمولاً عدد PORT که Railway داده، مثلاً `8080` یا `3000`)
5. ذخیره کن

> اگر Target Port اشتباه باشد، دقیقاً خطای "Application failed to respond" می‌گیری.

### ۲. Volume برای دیتابیس (خیلی مهم)
1. در Railway روی سرویس → **Volumes** یا **New Volume**
2. Mount Path را بگذار: `/etc/x-ui`
3. بدون این کار، هر بار ریستارت تنظیمات و کاربران پاک می‌شود.

### ۳. چک کردن لاگ‌ها
در تب **Deployments → View Logs** باید این خطوط را ببینی:
```
🚀 3x-ui starting on Railway
   PORT = xxxx
Starting x-ui process...
```
اگر خطا دیدی، اسکرین‌شات یا متن لاگ را بفرست.

### ۴. ورود به پنل
- آدرس: `https://your-domain.up.railway.app`
- یوزر/پسورد پیش‌فرض معمولاً `admin` / `admin` است (فوری عوض کن)

## نکات
- برای اینباندهای Reality و gRPC از **TCP Proxy** استفاده کن.
- اگر نسخه جدید ۳x-ui آمد، فقط `XUI_VERSION` داخل Dockerfile را عوض کن.

FROM python:3.10-slim

WORKDIR /app

# نصب dependencies سیستمی مورد نیاز
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# کپی کردن تمام فایل‌های پروژه
COPY . .

# نصب dependencies پایتون
RUN pip install --no-cache-dir -e .

# ایجاد دایرکتوری برای داده‌ها
RUN mkdir -p /app/data

# expos کردن پورت (اگر لازم است)
EXPOSE 8000

# اجرای برنامه
CMD ["python", "-m", "autogpt"]

FROM alpine:3.20

RUN apk add --no-cache \
    curl \
    bash \
    ca-certificates \
    tzdata \
    sqlite \
    && ln -sf /usr/share/zoneinfo/Asia/Tehran /etc/localtime

# آخرین نسخه پایدار ۳x-ui (در صورت نیاز نسخه را آپدیت کنید)
ARG XUI_VERSION=v3.7.0
RUN curl -L "https://github.com/mhsanaei/3x-ui/releases/download/${XUI_VERSION}/x-ui-linux-amd64.tar.gz" -o /tmp/x-ui.tar.gz \
    && tar -xzf /tmp/x-ui.tar.gz -C /usr/local/ \
    && rm /tmp/x-ui.tar.gz \
    && chmod +x /usr/local/x-ui/x-ui \
    && mkdir -p /etc/x-ui /var/log/x-ui

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 2053

CMD ["/start.sh"]

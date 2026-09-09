FROM alpine:3.20

RUN apk add --no-cache \
    curl \
    bash \
    ca-certificates \
    tzdata \
    sqlite \
    && ln -sf /usr/share/zoneinfo/Asia/Tehran /etc/localtime \
    && mkdir -p /etc/x-ui /var/log/x-ui /usr/local/x-ui

# دانلود و نصب آخرین نسخه پایدار
ARG XUI_VERSION=v3.7.0
RUN curl -fsSL "https://github.com/mhsanaei/3x-ui/releases/download/${XUI_VERSION}/x-ui-linux-amd64.tar.gz" -o /tmp/x-ui.tar.gz \
    && tar -xzf /tmp/x-ui.tar.gz -C /tmp \
    && mv /tmp/x-ui/* /usr/local/x-ui/ \
    && rm -rf /tmp/x-ui.tar.gz /tmp/x-ui \
    && chmod +x /usr/local/x-ui/x-ui \
    && chmod +x /usr/local/x-ui/bin/xray-linux-amd64 || true

COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /usr/local/x-ui

EXPOSE 2053

CMD ["/start.sh"]

FROM alpine:3.20

ENV TZ=Asia/Tehran
RUN apk add --no-cache curl bash ca-certificates tzdata sqlite \
    && ln -sf /usr/share/zoneinfo/Asia/Tehran /etc/localtime \
    && mkdir -p /etc/x-ui /var/log/x-ui /usr/local/x-ui

ARG XUI_VERSION=v3.7.0
RUN curl -fsSL "https://github.com/mhsanaei/3x-ui/releases/download/${XUI_VERSION}/x-ui-linux-amd64.tar.gz" -o /tmp/x-ui.tar.gz \
    && tar -xzf /tmp/x-ui.tar.gz -C /tmp \
    && cp -a /tmp/x-ui/. /usr/local/x-ui/ \
    && rm -rf /tmp/x-ui /tmp/x-ui.tar.gz \
    && chmod +x /usr/local/x-ui/x-ui \
    && chmod +x /usr/local/x-ui/bin/xray-linux-amd64 2>/dev/null || true

COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /usr/local/x-ui
EXPOSE 8080

CMD ["/start.sh"]

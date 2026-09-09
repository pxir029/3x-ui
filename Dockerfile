# ========================================================
# Stage: Frontend (Vite) — تغییرات LoginPage اینجا بیلد می‌شود
# ========================================================
FROM --platform=$BUILDPLATFORM node:22-alpine AS frontend
WORKDIR /src/frontend
COPY frontend/package.json frontend/package-lock.json ./
RUN npm ci
COPY frontend/ ./
COPY internal/web/translation /src/internal/web/translation
RUN npm run build

# ========================================================
# Stage: Builder (Go)
# ========================================================
FROM golang:1.27-alpine AS builder
WORKDIR /app
ARG TARGETARCH=amd64

RUN apk --no-cache --update add build-base gcc curl unzip

COPY . .
COPY --from=frontend /src/internal/web/dist ./internal/web/dist

ENV CGO_ENABLED=1
ENV CGO_CFLAGS="-D_LARGEFILE64_SOURCE"
RUN go build -ldflags "-w -s" -o build/x-ui main.go
RUN ./DockerInit.sh "$TARGETARCH"

# ========================================================
# Stage: Runtime
# ========================================================
FROM alpine:3.20
ENV TZ=Asia/Tehran
WORKDIR /app

RUN apk add --no-cache --update ca-certificates tzdata bash curl openssl sqlite \
    && ln -sf /usr/share/zoneinfo/Asia/Tehran /etc/localtime \
    && mkdir -p /etc/x-ui /var/log/x-ui

COPY --from=builder /app/build/ /app/
COPY --from=builder /app/DockerEntrypoint.sh /app/
COPY --from=builder /app/x-ui.sh /usr/bin/x-ui
COPY --from=builder /app/internal/web/translation /app/internal/web/translation
COPY start.sh /start.sh

RUN chmod +x /app/DockerEntrypoint.sh /app/x-ui /usr/bin/x-ui /start.sh

ENV XUI_IN_DOCKER="true"
ENV XUI_MAIN_FOLDER="/app"
ENV XUI_ENABLE_FAIL2BAN="false"

EXPOSE 8080
VOLUME ["/etc/x-ui"]
CMD ["/start.sh"]

FROM alpine:3.20

RUN apk add --no-cache ca-certificates curl unzip

# 下载 Xray 核心（自动取最新版）
RUN curl -L -o /tmp/x.zip \
      https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
 && unzip /tmp/x.zip -d /usr/local/bin \
 && rm -f /tmp/x.zip \
 && chmod +x /usr/local/bin/xray

COPY config.json /etc/xray/config.json

EXPOSE 8080

CMD ["/usr/local/bin/xray", "-c", "/etc/xray/config.json"]

FROM rclone/rclone:1.53.2

LABEL "repository"="https://github.com/ldxw/BitwardenRS-Backup" \
  "homepage"="https://github.com/ldxw/BitwardenRS-Backup" \
  "maintainer"="ldxw <git@ldxw.top>"

COPY scripts/*.sh /app/

RUN chmod +x /app/*.sh \
  && sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk add --no-cache sqlite zip heirloom-mailx tzdata

ENTRYPOINT ["/app/entrypoint.sh"]


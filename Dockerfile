FROM busybox:uclibc as busybox

FROM envoyproxy/envoy:v1.26-latest

COPY --from=busybox /bin/sh /bin/sh
COPY --from=busybox /bin/sed /bin/sed
COPY --from=busybox /bin/base64 /bin/base64

COPY config.yml.tmpl /usr/local/etc/envoy/config.yml.tmpl
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

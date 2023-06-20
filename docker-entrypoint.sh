#!/bin/sh

BIND_ADDRESS=${BIND_ADDRESS:-0.0.0.0}
BIND_PORT=${BIND_PORT:-8443}

[ -z "$TARGET_HOST" ] && echo "TARGET_HOST is required" && exit 1
[ -z "$TARGET_PORT" ] && echo "TARGET_PORT is required" && exit 1
[ -z "$BIND_TLS_CERT_B64" ] && echo "BIND_TLS_CERT_B64 is required" && exit 1
[ -z "$BIND_TLS_KEY_B64" ] && echo "BIND_TLS_KEY_B64 is required" && exit 1
[ -z "$TARGET_TLS_CERT_B64" ] && echo "TARGET_TLS_CERT_B64 is required" && exit 1

echo "${BIND_TLS_CERT_B64}" | base64 -d > /usr/local/etc/envoy/bind-tls.crt
echo "${BIND_TLS_KEY_B64}" | base64 -d > /usr/local/etc/envoy/bind-tls.key
echo "${TARGET_TLS_CERT_B64}" | base64 -d > /usr/local/etc/envoy/target-tls.cert

sed \
  -e "s/__TMPL_BIND_ADDRESS__/$BIND_ADDRESS/g" \
  -e "s/__TMPL_BIND_PORT__/$BIND_PORT/g" \
  -e "s/__TMPL_TARGET_HOST__/$TARGET_HOST/g" \
  -e "s/__TMPL_TARGET_PORT__/$TARGET_PORT/g" \
  /usr/local/etc/envoy/config.yml.tmpl | \
  tee /usr/local/etc/envoy/config.yml

exec envoy -c /usr/local/etc/envoy/config.yml "$@"

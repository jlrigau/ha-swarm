#!/usr/bin/env bash

if [ ! -f /usr/local/etc/haproxy/haproxy.cfg ]; then
    cp /haproxy.cfg.default /usr/local/etc/haproxy/haproxy.cfg
fi

echo "running.."

haproxy -f /usr/local/etc/haproxy/haproxy.cfg
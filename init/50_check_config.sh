#!/bin/bash
chown -R abc:abc /app

if [ ! -f /config/.config/qBittorrent/qBittorrent.conf ]; then
  echo "No config found, copy default now"
  mkdir -p /config/.config/qBittorrent/
  cp -v /defaults/qBittorrent.conf /config/.config/qBittorrent/qBittorrent.conf

  echo "Setting permissions"
  chown -Rv abc:abc /config
  chmod -Rv u+rw /config
  chown -Rv abc:abc /downloads
fi

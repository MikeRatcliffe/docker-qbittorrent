#!/bin/bash
chown -R abc:abc /app

if [ ! -f /config/.config/qBittorrent/qBittorrent.conf ]; then
  echo "No config found, copy default now"
  cp -v /defaults/qBittorrent.conf /config/.config/qBittorrent/qBittorrent.conf

  echo "Checking value of home:"
  echo "Home: $HOME"

  echo "Symlinking the config file"
  mkdir -p $HOME/.config/qBittorrent
  ln -sv /config/qBittorrent.conf $HOME/.config/qBittorrent/qBittorrent.conf

  echo "Setting permissions"
  chown -v abc:abc /config/qBittorrent.conf
  chmod -v u+rw /config/qBittorrent.conf
  chown -Rv abc:abc /downloads
fi

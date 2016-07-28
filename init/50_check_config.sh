#!/bin/bash
chown -R abc:abc /app

if [ ! -f /config/qBittorrent.conf ]; then
  echo "No config found, copys default now"
  cp -v /defaults/qBittorrent.conf /config/qBittorrent.conf

  echo "Symlinking the config file"
  mkdir -p $HOME/.config/qBittorrent
  ln -s /config/qBittorrent.conf $HOME/.config/qBittorrent/qBittorrent.conf

  echo "Setting permissions"
  chown abc:abc /config/qBittorrent.conf
  chmod u+rw /config/nzbget.conf
  chown -R abc:abc /downloads
fi

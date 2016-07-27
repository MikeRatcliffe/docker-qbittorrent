#!/bin/bash

PUID=${PUID:-911}
PGID=${PGID:-911}

if [ ! "$(id -u abc)" -eq "$PUID" ]; then usermod -o -u "$PUID" abc ; fi
if [ ! "$(id -g abc)" -eq "$PGID" ]; then groupmod -o -g "$PGID" abc ; fi

echo "
-----------------------------------------------------------
        _ _            __       _       _ _  __  __
  /\/\ (_) | _____    /__\ __ _| |_ ___| (_)/ _|/ _| ___
 /    \| | |/ / _ \  / \/// _` | __/ __| | | |_| |_ / _ \
/ /\/\ \ |   <  __/ / _  \ (_| | || (__| | |  _|  _|  __/
\/    \/_|_|\_\___| \/ \_/\__,_|\__\___|_|_|_| |_|  \___

Brought to you by Mike Ratcliffe
I do accept donations... send me cash ;)
-----------------------------------------------------------
GID/UID
-----------------------------------------------------------
User uid:    $(id -u abc)
User gid:    $(id -g abc)
-----------------------------------------------------------
"
chown -R abc:abc /app
chown -R abc:abc /config
chown abc:abc /defaults

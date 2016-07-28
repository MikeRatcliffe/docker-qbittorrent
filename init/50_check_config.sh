#!/bin/bash
chown -R abc:abc /app

# if [ ! -f /config/qBittorrent.conf ]; then
#   echo "No config found, copys default now"
#   cp -v /app/nzbget.conf /config/nzbget.conf
#   echo "Changeing some defaults to match our container"
#   sed -i -e "s#\(MainDir=\).*#\1/downloads#g" /config/nzbget.conf
#   sed -i -e "s#\(ScriptDir=\).*#\1$\{MainDir\}/scripts#g" /config/nzbget.conf
#   chown abc:abc /config/nzbget.conf
#   chmod u+rw /config/nzbget.conf
#   chown -R abc:abc /downloads
# fi


# echo "Checking some config options"
# if grep -q string file; then
#     sed -i 's/string/newstring/' file
# else
#     echo "newstring" >> file
# fi

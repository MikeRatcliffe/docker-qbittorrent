FROM phusion/baseimage:0.9.19
MAINTAINER Mike Ratcliffe <mratcliffe@mozilla.com>

ENV DEBIAN_FRONTEND="noninteractive" HOME="/root" TERM="xterm"
RUN useradd -u 911 -U -d /config -s /bin/false abc && \
    usermod -G users abc && \
    mkdir -p /config /defaults && \
    apt-get update && \
    apt-get install -y git python3-bs4 && \
    git clone https://github.com/jblakeman/apt-select /app/aptselect && \
    python3 /app/aptselect/apt-select/setup.py install && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

################################################################
# DO NOT EDIT ABOVE THIS LINE

ENV APTLIST="qbittorrent-nox"

#Volumes and Ports
ENV PORT=${PORT:-8080}
EXPOSE $PORT

################################################################
# DO NOT EDIT BELOW THIS LINE

VOLUME ["/config", "/downloads", "/defaults"]

ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
ADD defaults/ /defaults/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/*

CMD ["/bin/bash", "-c", "/sbin/my_init"]

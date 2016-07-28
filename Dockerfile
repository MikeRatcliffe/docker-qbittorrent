FROM phusion/baseimage:0.9.19
MAINTAINER Mike Ratcliffe <mratcliffe@mozilla.com>

ENV DEBIAN_FRONTEND="noninteractive" HOME="/root" TERM="xterm"
RUN useradd -u 911 -U -d /config -s /bin/false abc && \
    usermod -G users abc && \
    mkdir -p /app/aptselect /config /defaults && \
    LATEST_TAG=$(curl -sX GET "https://api.github.com/repos/jblakeman/apt-select/releases/latest" | awk '/tag_name/{print $4;exit}' FS='[""]') && \
    curl -L https://github.com/jblakeman/apt-select/archive/${LATEST_TAG}.tar.gz | tar xvz -C /app/aptselect --strip-components=1 && \
    apt-get update && \
    apt-get install -y python3-bs4 && \
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
ADD defaults/ /etc/defaults/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/*

CMD ["/sbin/my_init"]

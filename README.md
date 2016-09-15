# qBittorrent

[![](https://images.microbadger.com/badges/image/mikeratcliffe/docker_qbittorrent.svg)](https://microbadger.com/images/mikeratcliffe/docker_qbittorrent "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/mikeratcliffe/docker_qbittorrent.svg)](http://microbadger.com/images/mikeratcliffe/docker_qbittorrent "Get your own version badge on microbadger.com")

qBittorrent is a well known torrent downloader.

## Usage

```
docker create \
    --name="qbittorrent" \
    -v /path/to/qbittorrent/config:/config \
    -v /path/to/downloads:/downloads \
    -v /etc/localtime:/etc/localtime:ro \
    -e PORT=8080 \
    -p 8080:8080 \
    --restart always \
    mikeratcliffe/qbittorrent
```

**Parameters**

* `-p 8080` - the port(s)
* `-v /etc/localtime` for timesync - *optional*
* `-v /config` - Configuration file location
* `-v /downloads` - Location of downloads folder
* `-e PGID` for for GroupID - see below for explanation - *optional*
* `-e PUID` for for UserID - see below for explanation - *optional*

It is based on phusion-baseimage, for shell access whilst the container is running do `docker exec -it qbittorrent /bin/bash`.

### User / Group Identifiers

`The `PGID` and `PUID` values set the user / group you'd like your container to 'run as' to the host OS. This can be a user you've created or even root (not recommended).

## Setting up the application

Access WebUI at http://localhost:8080.

## Updates

* Upgrade to the latest version simply `docker restart qbittorrent`.
* To monitor the logs of the container in realtime `docker logs -f qbittorrent`.

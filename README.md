# Docker Radarr

Provide a simple docker image for [`radarr`].

[`radarr`]: https://github.com/Radarr/Radarr

The goal is to provide a simpler docker image that don't package a bootstrap script like [`linuxserver/radarr`] to be used on `docker-compose` & `k8s`.

[`linuxserver/radarr`]: https://github.com/linuxserver/docker-radarr

The image is provided at <https://hub.docker.com/r/firelightflagbot/radarr>

## Quick start

Here is a simple `docker-compose` file:

```yaml
services:
  radarr:
    image: firelightflagbot/radarr:4.7.5.7809
    user: 1234:1234 # This is the default uid/gid, you can change it.
    ports:
      - 7878:7878
    volumes:
      - type: bind
        source: /somewhere/radarr-config # The folder need to be owned by the set'd user in `services.radarr.user` (radarr need to be able to write to it).
        target: /config
```

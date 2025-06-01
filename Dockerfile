# syntax=docker/dockerfile:1.4

FROM --platform=$BUILDPLATFORM alpine:3.22 as builder

COPY --link pkg-info.json /pkg-info.json

ARG PKG_VERSION
ARG TARGETARCH

COPY --link in-docker-build.sh /build.sh

RUN sh /build.sh

FROM alpine:3.22

ARG PKG_VERSION

LABEL org.opencontainers.image.source="https://github.com/Radarr/Radarr"
LABEL org.opencontainers.image.description="Radarr is an indexer manager/proxy built on the popular arr .net/reactjs base stack to integrate with your various PVR apps."
LABEL org.opencontainers.image.version=${PKG_VERSION}
LABEL org.opencontainers.image.title="Radarr"

COPY --from=builder /opt/radarr /opt/radarr
RUN apk --no-cache add icu-libs sqlite-libs

USER 1234:1234

ENTRYPOINT [ "/opt/radarr/Radarr", "-nobrowser", "-data=/config" ]

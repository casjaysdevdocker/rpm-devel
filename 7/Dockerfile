FROM centos:7 as build

ARG LICENSE=WTFPL \
  IMAGE_NAME=rpm-devel \
  TIMEZONE=America/New_York \
  PORT=

ENV SHELL=/bin/bash \
  TERM=xterm-256color \
  HOSTNAME=${HOSTNAME:-casjaysdev-$IMAGE_NAME} \
  TZ=$TIMEZONE

RUN rm -Rf /usr/local/bin/.gitkeep /config /data && \
  yum update -y && \
  yum install -y systemd curl git wget rpmbuild

COPY ./etc/. /etc/.
COPY ./bin/. /usr/local/bin/
COPY /etc/skel/. /root/

FROM scratch
ARG BUILD_DATE="$(date +'%Y-%m-%d %H:%M')"

LABEL org.label-schema.name="rpm-devel" \
  org.label-schema.description="Containerized version of rpm-devel" \
  org.label-schema.url="https://hub.docker.com/r/casjaysdevdocker/rpm-devel" \
  org.label-schema.vcs-url="https://github.com/casjaysdevdocker/rpm-devel" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.version=$BUILD_DATE \
  org.label-schema.vcs-ref=$BUILD_DATE \
  org.label-schema.license="$LICENSE" \
  org.label-schema.vcs-type="Git" \
  org.label-schema.schema-version="latest" \
  org.label-schema.vendor="CasjaysDev" \
  maintainer="CasjaysDev <docker-admin@casjaysdev.com>"

ENV SHELL="/bin/bash" \
  TERM="xterm-256color" \
  HOSTNAME="casjaysdev-rpm-devel" \
  TZ="${TZ:-America/New_York}"

WORKDIR /root

VOLUME ["/root/rpmbuild","/config","/data"]

EXPOSE $PORT

COPY --from=build /. /

ENTRYPOINT [ "/usr/sbin/init" ]
HEALTHCHECK CMD [ "/usr/local/bin/entrypoint-rpm-devel.sh", "healthcheck" ]
CMD [ "/usr/local/bin/entrypoint-rpm-devel.sh" ]

FROM openjdk:8u265-jre-slim-buster AS builder

ARG VERSION

ADD https://github.com/validator/validator/releases/download/${VERSION}/vnu.jar_${VERSION}.zip /vnu.zip

RUN apt update \
 && DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y unzip \
 && unzip /vnu.zip \
 && mkdir -p /files/usr/lib \
 && mv /dist /files/usr/lib/validator



FROM scratch AS base

ADD files /

COPY --from=builder /files /



FROM openjdk:8u265-jre-slim-buster

COPY --from=base / /

WORKDIR /work

ENTRYPOINT [ "validator" ]
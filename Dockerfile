FROM openjdk:8u265-jre-slim-buster AS builder

ARG VERSION

ADD files /files
ADD https://github.com/validator/validator/releases/download/${VERSION}/vnu.jar_${VERSION}.zip /vnu.zip

RUN apt update \
 && DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y unzip wget \
 && unzip /vnu.zip -d /files



FROM openjdk:8u265-jre-slim-buster

COPY --from=builder /files /

WORKDIR /work

ENTRYPOINT [ "validator" ]
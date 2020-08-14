FROM openjdk:8u265-jre-slim-buster

ARG VERSION=master

RUN true \
 #
 # Installing dependencies
 && apt update \
 && DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y git python3 python3-pip python3-setuptools python3-wheel \
 #
 # Intsall html5validator
 # && pip3 install html5validator \
 && git clone -b ${VERSION} https://github.com/svenkreiss/html5validator.git /tmp/html5validator \
 && cd /tmp/html5validator \
 && python3 setup.py install \
 && cd \
 && rm -rf /tmp/html5validator \
 #
 # Cleaning up
 && DEBIAN_FRONTEND=noninteractive apt remove -y git python3-pip python3-wheel \
 && apt autoremove -y \
 && rm -rf /var/lib/apt/lists/* \
 #
 # Verify
 && html5validator --version

WORKDIR /work

ENTRYPOINT [ "html5validator" ]
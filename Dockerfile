FROM openjdk:8u265-jre-slim-buster

RUN true \
 #
 # Installing dependencies
 && apt update \
 && DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y python3 python3-pip python3-setuptools python3-wheel \
 #
 # Intsll html5validator
 && pip3 install html5validator \
 #
 # Cleaning up
 && DEBIAN_FRONTEND=noninteractive apt remove -y python3-pip python3-setuptools python3-wheel \
 && apt autoremove -y \
 && rm -rf /var/lib/apt/lists/* \
 #
 # Verify
 && html5validator --version

WORKDIR /work

ENTRYPOINT [ "html5validator" ]
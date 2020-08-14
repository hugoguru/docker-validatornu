FROM openjdk:8u265-jre-slim-buster

ARG VERSION

RUN true \
 #
 # Installing dependencies
 && apt update \
 && DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y unzip wget \
 #
 # Intsall validator
 && wget -q https://github.com/validator/validator/releases/download/${VERSION}/vnu.jar_${VERSION}.zip -O  /vnu.zip \
 && unzip /vnu.zip \
 && rm -f vnu.zip \
 #
 # Cleaning up
 && DEBIAN_FRONTEND=noninteractive apt remove -y unzip wget \
 && apt autoremove -y \
 && rm -rf /var/lib/apt/lists/* \
 #
 # Verify
 && java -jar /dist/vnu.jar --version

WORKDIR /work

ENTRYPOINT [ "java", "-jar", "/dist/vnu.jar" ]
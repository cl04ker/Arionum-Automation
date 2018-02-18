FROM alpine:latest
LABEL maintainer "Elliot Still <cl04ker@gmail.com>"

RUN apk --no-cache add \
  bash \
  build-base \
  gcc \
  git \
  make \
  maven \
  openjdk8

RUN git clone git://github.com/ProgrammerDan/arionum-java

COPY pom-slim.xml /arionum-java/arionum-miner/pom.xml

RUN cd arionum-java/arionum-miner \
  && mvn -e clean package \
  && chmod +x build-argon.sh \
  && ./build-argon.sh

ENV HASHER_MODE=standard

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

ARG BUILD_DATE
ARG VCS_REF

FROM alpine:3.10 as ruby-runtime
MAINTAINER Bryan Talbot <bryan.talbot@ijji.com>
# Build-time metadata as defined at http://label-schema.org
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="Dockerfile" \
      org.label-schema.license="MIT" \
      org.label-schema.name="Docker ruby runtime" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-type="git" \
      org.label-schema.vcs-url="https://github.com/iJJi/docker-ruby" \
      org.label-schema.vendor="Ijji, inc."
RUN apk add --no-cache ruby ruby-bigdecimal ruby-io-console ruby-bundler ruby-webrick ca-certificates wget libxslt libxml2 && \
    gem install bundler -v '~> 1.0' --no-doc && rm -f `gem env gemdir`/cache/*.gem
WORKDIR /usr/src/app


FROM ruby-runtime as ruby-builder
MAINTAINER Bryan Talbot <bryan.talbot@ijji.com>
# Build-time metadata as defined at http://label-schema.org
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="Dockerfile" \
      org.label-schema.license="MIT" \
      org.label-schema.name="Docker ruby builder" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-type="git" \
      org.label-schema.vcs-url="https://github.com/iJJi/docker-ruby" \
      org.label-schema.vendor="Ijji, inc."
RUN apk add --no-cache -t build-deps ruby-dev make gcc libc-dev pcre-dev linux-headers g++ git libxml2-dev libxslt-dev zlib-dev

FROM anapsix/alpine-java:8

RUN apk add --update curl && \
rm -rf /var/cache/apk/*

ENV WM_PACKAGE wiremock-jre8-standalone
ARG WM_VERSION=2.35.0

RUN mkdir /$WM_PACKAGE
WORKDIR /$WM_PACKAGE

RUN curl -sSL -o $WM_PACKAGE.jar https://repo1.maven.org/maven2/com/github/tomakehurst/$WM_PACKAGE/$WM_VERSION/$WM_PACKAGE-$WM_VERSION.jar
EXPOSE 8088

ENTRYPOINT ["java","-jar","wiremock-jre8-standalone.jar","--verbose", "--port", "80"]

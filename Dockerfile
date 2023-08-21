FROM wiremock/wiremock:latest

COPY wiremock /home/wiremock

ENTRYPOINT ["/docker-entrypoint.sh", "--global-response-templating", "--disable-gzip", "--verbose"]
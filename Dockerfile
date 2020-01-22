FROM fluent/fluentd:v1.0-debian

LABEL gov.va.ascent.component="logging"

ENV ES_PORT=9200
ENV ES_HOST=elastic.internal.vets-api.gov
ENV SCHEME=http
ENV SSL_VERIFY=false

USER root

#Install ElasticSearch plugin
RUN ["gem", "install", "fluent-plugin-elasticsearch", "--no-rdoc", "--no-ri", "--version", "1.9.5"]
RUN ["gem", "install", "fluent-plugin-prometheus", "--no-rdoc", "--no-ri", "--version", "1.0.0"]
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*;

WORKDIR /fluentd/etc

#Add our custom configurations
ADD conf /fluentd/etc

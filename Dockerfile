ARG GRAFANA_VERSION="latest"

FROM grafana/grafana:${GRAFANA_VERSION}

ARG GF_GID="0"

# ENV GF_ROOT="var/lib/grafana"
ENV GF_PATHS_PLUGINS="/var/lib/grafana-plugins"
ENV GF_DEFAULT_APP_MODE="development"

USER root

RUN mkdir -p "$GF_PATHS_PLUGINS" && \
    chown -R grafana:${GF_GID} "$GF_PATHS_PLUGINS"

COPY "./grafana.db" "${GF_PATHS_DATA}/grafana.db"

USER grafana

COPY "./sneller-datasource/snellerinc-sneller-datasource" "${GF_PATHS_PLUGINS}/snellerinc-sneller-datasource"

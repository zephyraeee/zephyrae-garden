FROM ghcr.io/chemchu/garden-engine:1.0.0

COPY --chown=app:app garden /app/site/garden
COPY --chown=app:app assets /app/site/assets
COPY --chown=app:app site.toml garden-dates.tx[t] /app/site/

ENV CONTENT_DIR=/app/site
ENV GARDEN_DATES_FILE=/app/site/garden-dates.txt

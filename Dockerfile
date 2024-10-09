# Default to the latest version if no version is provided at build time
ARG SURREAL_VERSION=latest

# Default to port 8000 if no port is provided at build time
ARG SURREAL_PORT=8000

# Use the specified version of the SurrealDB Docker image
FROM surrealdb/surrealdb:${SURREAL_VERSION} as surreal
FROM alpine/curl:3

# Expose the default SurrealDB port
EXPOSE $SURREAL_PORT

COPY --from=surreal /surreal .
COPY ./entrypoint.sh .

ENTRYPOINT ["/entrypoint.sh"]
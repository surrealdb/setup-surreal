# Default to the latest version if no version is provided at build time
ARG SURREAL_VERSION=latest

# Default to port 8000 if no port is provided at build time
ARG SURREAL_PORT=8000

# Use the specified version of the SurrealDB Docker image
FROM surrealdb/surrealdb:${SURREAL_VERSION} as surreal
FROM ubuntu:latest

# Expose the default SurrealDB port
EXPOSE $SURREAL_PORT

COPY --from=surreal /surreal .
COPY ./entrypoint.sh .

RUN ls -la
RUN ls -la /surreal

RUN chmod +x /surreal

ENTRYPOINT ["/entrypoint.sh"]
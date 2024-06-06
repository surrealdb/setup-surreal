#!/bin/sh

VERSION=$1 			# Can be latest or a specific version starting at 1.x.x, default is latest
PORT=$2 			# Port to expose the SurrealDB service, default is 8000
USERNAME=$3 		# Username to access for root user, default is not provided
PASSWORD=$4 		# Password to access for root user, default is not provided
AUTH=$5 			# Enable or disable authentication, default is not provided
STRICT=$6 			# Enable or disable strict mode, default is not provided
LOG=$7 				# Setting logging, default is not provided. SurrealDB sets logging to `info` by default
ADDITIONAL=$8 		# Additional arguments to pass to the SurrealDB service

if [ -z "$VERSION" ]; then
	VERSION="latest"
fi

if [ -z "$PORT" ]; then
	PORT="8000"
fi

if [ -z "$USERNAME" ]; then
	USERNAME=""
else
	USERNAME="--user $USERNAME"
fi

if [ -z "$PASSWORD" ]; then
	PASSWORD=""
else
	PASSWORD="--pass $PASSWORD"
fi

if [ "$AUTH" = "true" ]; then
	AUTH="--auth"
else
	AUTH=""
fi

if [ "$STRICT" = "true" ]; then
	STRICT="--strict"
else
	STRICT=""
fi

if [ -z "$LOG" ]; then
	LOG=""
else
	LOG="--log $LOG"
fi

if [ -z "$ADDITIONAL" ]; then
	ADDITIONAL=""
fi

echo "SurrealDB version: $VERSION - Port: $PORT"

docker pull surrealdb/surrealdb:$VERSION
docker run --name surrealdb --publish $PORT:8000 --detach surrealdb/surrealdb:$VERSION start $USERNAME $PASSWORD $AUTH $STRICT $LOG $ADDITIONAL
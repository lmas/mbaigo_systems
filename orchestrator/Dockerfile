# Documentation: https://docs.docker.com/reference/dockerfile/

# Use alpine linux container with golang pre-installed as the build environment
FROM golang:1.23-alpine AS builder

# Switch to a temporary dir while building
WORKDIR /src/

# Copy and download dependencies first (utilising docker's build caches in a better way)
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the source and compile it
COPY *.go ./
RUN go build -o system

################################################################################

# Setup a clean container without any build tools that takes up unnecessary space
FROM alpine:3.22 AS final

LABEL org.opencontainers.image.source=https://github.com/lmas/mbaigo_systems
LABEL org.opencontainers.image.licenses=MIT
LABEL org.opencontainers.image.description="The Orchestrator system is one of the essential core systems of the Arrowhead framework. When seeking for a service provider, all systems ask the Orchestrator for the URL of a service."

# Install dependencies
RUN apk add curl

# Copy built files from the previous builder environment
COPY --from=builder /src/system /orchestrator
WORKDIR /data

# Set the default port used by the system (and allows being changed by user)
ENV PORT=20103

# Runs periodic health checks on the system
HEALTHCHECK --interval=1m CMD curl -f "http://localhost:$PORT/" || exit 1

# Run the system
CMD ["/orchestrator"]

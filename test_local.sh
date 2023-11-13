#!/usr/bin/env bash
set -e

# This script is used to test the lambda function locally
function log {
    echo -e "\033[32m$1\033[0m"
}

# First build just the go code
log "Building go code"
make go-build

# Rebuild the SAM application
log "Building SAM application"
sam build 

# Invoke the lambda function
log "Invoking lambda function (using env variables from .env, event from event.json)"
touch .env
touch event.json
sam local invoke --env-vars .env -e event.json

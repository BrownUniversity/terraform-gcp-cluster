#!/usr/bin/bash

export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcp/project-factory-gcp.json"

deactivate() {
    unset GOOGLE_APPLICATION_CREDENTIALS
}
#!/bin/bash

export RBE_INSTANCE="<instance name>"
export CREDENTIALS_FILE="<credentials file path>"

bazelisk \
    --bazelrc=.bazelrc \
    build \
    --config=remote \
    --remote_instance_name=${RBE_INSTANCE} \
    --google_credentials=${CREDENTIALS_FILE} \
    --action_env=RAND=$RANDOM \
    //...
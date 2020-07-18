#!/bin/bash

export RBE_INSTANCE="<enter instance name>"
export CREDENTIALS_FILE="<enter path to credential file>"

bazelisk \
    --bazelrc=.bazelrc \
    build \
    --config=remote \
    --remote_instance_name=${RBE_INSTANCE} \
    --google_credentials=${CREDENTIALS_FILE} \
    --action_env=RAND=$RANDOM \
    //...
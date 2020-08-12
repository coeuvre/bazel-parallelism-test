#!/bin/bash

bazel build \
    --config=remote \
    --action_env=RAND=$RANDOM \
    //...

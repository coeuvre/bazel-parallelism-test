#!/bin/sh

# alias mybazel="~/github/coeuvre/bazel/bazel-bin/src/bazel --host_jvm_debug --host_jvm_args=\"-Djava.util.logging.config.file=/Users/chiwang/github/coeuvre/bazel-parallelism-test/javalog.properties\""
# alias mybazel="~/github/coeuvre/bazel/bazel-bin/src/bazel --host_jvm_args=\"-Djava.util.logging.config.file=javalog.properties\""
# alias mybazel="~/github/coeuvre/bazel/bazel-bin/src/bazel --host_jvm_debug"
alias mybazel="~/github/coeuvre/bazel/bazel-bin/src/bazel"
# alias mybazel=bazelisk

mybazel clean

mybazel build \
    --action_env=RANDOM=$RANDOM \
    --profile=$(pwd)/profile.json \
    --verbose_failures \
    --remote_executor=grpc://chiwang2.bej.corp.google.com:9092 \
    --experimental_spawn_scheduler \
    --experimental_local_execution_delay=0 \
    --remote_download_minimal \
    --jobs=500 \
    //...

    # --build_event_json_file=bep.json \
    # --remote_executor=grpc://chiwang2.bej.corp.google.com:9092 \
    # --remote_cache=grpc://chiwang2.bej.corp.google.com:9092 \
    # --remote_download_minimal \
    # --experimental_spawn_scheduler \
    # --experimental_local_execution_delay=0 \
    # --disk_cache=disk_cache \
    # --action_env=RANDOM=$RANDOM \
    # --remote_timeout=1 \
    # --remote_executor=grpc://chiwang2.bej.corp.google.com:9092 \
    # --experimental_remote_grpc_log=grpc.log \
    # --action_env=RANDOM=$RANDOM \
# --remote_cache=grpc://myremoteexecutor:9092 \
# --experimental_remote_grpc_log=/Users/chiwang/github/coeuvre/bazel-parallelism-test/logs/grpc.log \
# --build_event_json_file=/Users/chiwang/github/coeuvre/bazel-parallelism-test/logs/bep.json \

#    --remote_executor=grpc://localhost:9092 \
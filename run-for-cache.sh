#!/bin/sh

# alias mybazel="~/github/coeuvre/bazel/bazel-bin/src/bazel --host_jvm_debug --host_jvm_args=\"-Djava.util.logging.config.file=/Users/chiwang/github/coeuvre/bazel-parallelism-test/javalog.properties\""
# alias mybazel="~/github/coeuvre/bazel/bazel-bin/src/bazel --host_jvm_args=\"-Djava.util.logging.config.file=javalog.properties\""
# alias mybazel=~/github/coeuvre/bazel/bazel-bin/src/bazel
alias mybazel="~/github/coeuvre/bazel/bazel-bin/src/bazel --host_jvm_debug"
# alias mybazel=bazelisk

mybazel clean

mybazel build \
    --experimental_guard_against_concurrent_changes \
    --remote_cache=http://localhost:8080 \
    --verbose_failures \
    --jobs=500 \
    //:test


    # --remote_download_minimal \
    # --experimental_spawn_scheduler \
    # --experimental_local_execution_delay=0 \
    # --experimental_remote_grpc_max_channels=10 \
# --remote_cache=grpc://myremoteexecutor:9092 \
# --experimental_remote_grpc_log=/Users/chiwang/github/coeuvre/bazel-parallelism-test/logs/grpc.log \
# --build_event_json_file=/Users/chiwang/github/coeuvre/bazel-parallelism-test/logs/bep.json \

#    --remote_executor=grpc://localhost:9092 \
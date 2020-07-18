#!/bin/bash

rm BUILD.bazel
for i in {1..500};
do
    cat << EOF >> BUILD.bazel
genrule(
  name = "parallelism-test-$i",
  srcs = [],
  cmd = "sleep 5 && touch \$@",
  outs = ["$i.txt"],
)
EOF

done
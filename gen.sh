#!/bin/bash

rm BUILD

echo "Generating BUILD..."

cat << EOF >> BUILD
platform(
    name = "rbe_platform_parallelism_test",
    parents = ["@rbe_default//config:platform"],
    remote_execution_properties = """
        {PARENT_REMOTE_EXECUTION_PROPERTIES}
    """,
)
EOF

MAX_INPUT=5000
MAX_TARGET=5000

for ((i=0; i<$MAX_TARGET; i++))
do
  cat << EOF >> BUILD
genrule(
  name = "test-$i",
  srcs = [],
  outs = ["$i.tar.gz"],
  cmd = "mkdir tmp-$i && cp \$(SRCS) tmp-$i && tar czf \$@ tmp-$i && rm -rf tmp-$i"
)
EOF

  for ((j=($RANDOM%$MAX_INPUT)/2; j<$MAX_INPUT; j+=($RANDOM%$MAX_INPUT)/2))
  do
    echo "\"add srcs input/$j.txt\"" ":test-$i" | xargs buildozer 2> /dev/null
  done

  for ((j=i+1+($RANDOM%$MAX_TARGET)/2; j<$MAX_TARGET; j+=($RANDOM%$MAX_TARGET)/2))
  do
    echo "\"add srcs :test-$j\"" ":test-$i" | xargs buildozer 2> /dev/null
  done

done
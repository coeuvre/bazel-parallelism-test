#!/bin/sh

rm -rf BUILD

echo "Generating BUILD..."

MAX_INPUT=5000
MAX_TARGET=5000

for ((i=0; i<$MAX_TARGET; i++))
do
  INPUTS=""
  OUTPUTS=""
  CMD="sleep 0 "

  for ((j=($RANDOM%$MAX_INPUT)/2; j<$MAX_INPUT; j+=(1+($RANDOM%$MAX_INPUT)/2)))
  do
    INPUTS="$INPUTS \"input/$j.txt\", "
    OUTPUTS="$OUTPUTS \"output-$i/$j.txt\", "
    CMD="$CMD && cp \$(location input/$j.txt) \$(location output-$i/$j.txt)"
  done

  cat << EOF >> BUILD
genrule(
  name = "test-$i",
  srcs = [$INPUTS],
  outs = [$OUTPUTS],
  cmd = "$CMD",
)
EOF

  for ((j=i+1+($RANDOM%$MAX_TARGET)/2; j<$MAX_TARGET; j+=($RANDOM%$MAX_TARGET)/2))
  do
    echo "\"add srcs :test-$j\"" ":test-$i" | xargs buildozer 2> /dev/null
  done
done

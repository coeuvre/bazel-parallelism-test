#!/bin/sh

rm -rf input

echo "Generating input..."

MAX_INPUT=5000

mkdir -p input
for ((i=0; i<$MAX_INPUT; i++))
do
  dd if=/dev/urandom bs=$(($RANDOM)) count=1 2> /dev/null | base64 > input/$i.txt
done

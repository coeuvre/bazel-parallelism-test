#!/bin/sh

MAX_INPUT=50

while true
do
  ./run.sh || exit 1

  # # Randomly dirty inputs
  # for ((i=0; i<2;++i))
  # do
  #   j=$(($RANDOM%$MAX_INPUT))
  #   dd if=/dev/urandom bs=$(($RANDOM)) count=1 2> /dev/null | base64 > input/$j.txt
  # done
done

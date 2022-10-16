#!/usr/bin/env bash

INPUT_DIR=$(pwd)/input
OUTPUT_DIR=$(pwd)/output

cd $INPUT_DIR
if [[ ! -z $1 ]]; then
  # specific files / options were passed, use that
  java -jar /app/plantuml.jar $@ -o $OUTPUT_DIR
  exit $?
fi

for f in *.plantuml; do
  [ -f "$f" ] || break
  echo $f
  java -jar /app/plantuml.jar "$f" -o $OUTPUT_DIR
done

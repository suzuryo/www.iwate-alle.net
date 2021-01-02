#!/usr/bin/env bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

docker-compose -f $SCRIPT_DIR/../docker-compose.yml -f $SCRIPT_DIR/../docker-compose-build.yml up iwatealle_middleman

#!/usr/bin/env bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

docker-compose -f $SCRIPT_DIR/../docker-compose.yml stop && docker-compose -f $SCRIPT_DIR/../docker-compose.yml rm -vf

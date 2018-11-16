#!/usr/bin/env bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

docker-compose -f $SCRIPT_DIR/../docker-compose.yml run --rm rspec_guard ruby bin/testrunner.rb docker --browser mobileEmu-chrome --spec_path spec

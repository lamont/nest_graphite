#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. ~/.nest_creds

$DIR/nest_output.rb | nc $GRAPHITE_HOST $GRAPHITE_PORT


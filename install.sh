#!/bin/sh

function usage {
   cat << EOF
usage: install.sh [PLATFORM=mac,linux]
EOF
   exit 1
}

if [ $# -gt 1 ]; then
   usage;
fi

if [ "$1" != "PLATFORM=mac" -o "$1" != "PLATFORM=linux" -o -z "$1" ]; then
  usage;
fi

PLATFORM=$1


#!/usr/bin/env bash

function usage {
   cat << EOF
usage: install.sh <theme>
    theme: boron (default), black
EOF
   exit 1
}

if [ $# -gt 0 ]; then
   usage;
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "Linux setup"
elif [[ "$OSTYPE" == "darwin" || "$OSTYPE" == "darwin15" ]]; then
    echo "OSX setup"
else
    echo "unsupported platform, aborting..."
fi



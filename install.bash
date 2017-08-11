#!/usr/bin/env bash

usage() { 
    echo "Usage: $0 [-c <|90>] [-l <string>]" 1>&2; exit 1; 
}

while getopts ":c:l:" opt; do
    case "${opt}" in
        c)
            color=${OPTARG}
            ((color == boron || color == black)) || usage
            ;;
        l)
            location=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${color}" ] || [ -z "${location}" ]; then
    usage
fi

echo "c = ${color}"
echo "l = ${location}"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "Linux setup"
elif [[ "$OSTYPE" == *"darwin"* ]]; then
    echo "OSX setup"
else
    echo "unsupported platform $OSTYPE, aborting..."
fi

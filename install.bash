#!/usr/bin/env bash

usage() { 
    echo "usage: $0 [-c <boron|black>] [-l <location>]

    -c      sublime theme color: black, boron
    -l      specify the location of your sublime text 3 folder
" 1>&2; exit 1; 
}

LOCATION=""
COLOR="Boron"

while true; do
    case $1 in
        -h)
            usage ;;
        -c)
            shift
            case $1 in
                boron) shift ;;
                black) COLOR="Black"; shift ;;
                *) usage; exit 1 ;;
            esac ;;
        -l)
            shift
            LOCATION=$1
            shift ;;
        -*) 
            echo "error: unrecognized option $1" >&2
            usage
            exit 2 ;;
        *)
            break ;;
    esac
done

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "Linux setup"
    ENV="Linux"
    if [[ "$LOCATION"=="" ]]; then
        LOCATION="$HOME/.config/sublime-text-3"
    fi
elif [[ "$OSTYPE" == *"darwin"* ]]; then
    echo "OSX setup"
    ENV="OSX"
else
    echo "unsupported platform $OSTYPE, aborting..."
fi

echo -n "Installing..."
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp  "$DIR/config/$COLOR.tmTheme" "$LOCATION/Packages/User"


echo " done."
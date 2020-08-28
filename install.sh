#!/bin/bash

APPLICATIONS=/usr/share/applications
BIN=/usr/local/bin

# dmenu check
if ! command -v dmenu > /dev/null; then
    echo "Kubemenu requires dmenu, please install dmenu first!"
    exit 1
fi

# notify-send check
if ! command -v notify-send > /dev/null; then
    echo "Kubemenu optionally requires notify-send, it would be nice to install it!"
fi

# terminal check 
MY_TERMINAL=""
if command -v urxvt > /dev/null; then
    MY_TERMINAL="urxvt";
elif command -v alacritty > /dev/null; then
    MY_TERMINAL="alacritty";
elif command -v xterm > /dev/null; then
    MY_TERMINAL="xterm";
else
    MY_TERMINAL=""
fi

if [ -z "$MY_TERMINAL" ]; then
    echo "Kubemenu requires one of the following terminals: [urxvt, alacirtty, xterm], please install one first!"
    exit 1
fi


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
sudo cp ${DIR}/bin/* /usr/local/bin
sudo cp ${DIR}/desktop/* /usr/share/applications
xdg-icon-resource install --novendor --size 96 ${DIR}/icons/kubernetes.png

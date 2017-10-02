#!/bin/bash

#name of the script
SCRIPTNAME="${0##*/}"

# the --download command
# just download the image builder file
download() {
    rm -rf $LEDEIMGBUILD_FILE
    echo
    wget -q --show-progress $LEDEIMGBUILD_URLS$LEDEIMGBUILD_FILE -O $LEDEIMGBUILD_FILE
    echo
}



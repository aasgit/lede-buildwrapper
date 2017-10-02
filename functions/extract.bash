#!/bin/bash

#name of the script
SCRIPTNAME="${0##*/}"

# the --extract command
# remove the old and extract the last downloaded file.xz
extract() {
    rm -rf $LEDEIMGBUILD_DIRS
    echo -e "\nExtracting $LEDEIMGBUILD_FILE...\n"
    tar xf $LEDEIMGBUILD_FILE
    echo -e "Done!!!\n"
}



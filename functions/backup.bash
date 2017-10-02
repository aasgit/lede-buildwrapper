#!/bin/bash

#name of the script
SCRIPTNAME="${0##*/}"

# the --backup-img command
# create a backup copy of the latest build files to a backup dir
backupimg() {
    mkdir -p "$BUILTIMGBCKDIR"
    echo -e "\nCopying '$LEDEIMGBUILD_DIRS/bin/targets/mvebu/generic/*' to '$BUILTIMGBCKDIR/'....\n"
    cp -a $LEDEIMGBUILD_DIRS/bin/targets/mvebu/generic/* $BUILTIMGBCKDIR/
}


#!/bin/bash

#name of the script
SCRIPTNAME="${0##*/}"

# the --img-info command
getinfo() {
    # Image builder complete info
    LEDEIMGBUILD_INFO=$(curl -sk $LEDEIMGBUILD_URLS | html2text --ignore-links --single-line-break --body-width=0 | grep "$LEDEIMGBUILD_FILE")
    echo -e "\nThe latest online ImageBuilder is:\n\n$LEDEIMGBUILD_INFO\n"
}



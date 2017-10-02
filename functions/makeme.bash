#!/bin/bash

#name of the script
SCRIPTNAME="${0##*/}"

# the --make-image command
# simply print to screen a make clean + make image command to copy and manually run
makeme() {
    if [[ "$CUSTOMCFG" == "true" ]]; then
        echo -e "\nmake clean\nmake image PROFILE=\""$PROFILE"\" PACKAGES=\""$PCKGSLIST"\" FILES=\""$FILES"\" EXTRA_IMAGE_NAME=\""$EXTRA_IMAGE_NAME"\"\n"
    else
        echo -e "\nmake clean\nmake image PROFILE=\""$PROFILE"\" PACKAGES=\""$PCKGSLIST"\" EXTRA_IMAGE_NAME=\""$EXTRA_IMAGE_NAME"\"\n"
    fi
}



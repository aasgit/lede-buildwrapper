#!/bin/bash

#name of the script
SCRIPTNAME="${0##*/}"

# the --copy-files command
# provided that you have a files/ dir, it will copy its contents to image builder dir
copyconffiles() {
    if [ -d "$FILES" ]; then
        if [ ! -d "$LEDEIMGBUILD_DIRS/$FILES" ]; then
            echo -e "\nCopying '$FILES' to '$LEDEIMGBUILD_DIRS/' ...\n"
            \cp -af $FILES $LEDEIMGBUILD_DIRS/
            echo -e "Done!!!\n"
        else
            read -p "Do you want to overwrite the files directory? [y/N]  "
                case $REPLY in
                    [Yy]) rm -rf $LEDEIMGBUILD_DIRS/$FILES/*; \cp -af $FILES $LEDEIMGBUILD_DIRS/; echo -e "\nDone!!!\n"; exit 3;;
                    *) echo -e "\nNo files were overwritten\n"; exit 5;;
                esac
        fi
    else
        echo -e "\nThe files directory '$FILES' does NOT exist. You need to create it first...\n"
        exit 10
    fi
}



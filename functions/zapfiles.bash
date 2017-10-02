#!/bin/bash

#name of the script
SCRIPTNAME="${0##*/}"

zapfiles() {
    if [[ "$FORCE" == "true" ]]; then
        \rm -f $LEDEIMGBUILD_FILE
        \rm -rf $LEDEIMGBUILD_DIRS
    else
        echo
        read -p "Are you sure oyu want to delete $LEDEIMGBUILD_FILE and $LEDEIMGBUILD_DIRS ? [y/N]  "
            case $REPLY in
                [Yy])
                    rm -f $LEDEIMGBUILD_FILE
                    rm -rf $LEDEIMGBUILD_DIRS
                    echo -e "\nDone!\n"
                    exit 9;;
                *) echo -e "\n'$LEDEIMGBUILD_FILE' and '$LEDEIMGBUILD_DIRS' left intact\n"; exit 5;;
            esac
        fi
}

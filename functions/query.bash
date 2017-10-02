#!/bin/bash

#name of the script
SCRIPTNAME="${0##*/}"

# the --query-repos command
# query the above specified repos for a specific package (to check if available)
queryrepos() {
    if [ -n "$1" ]; then
    PACKAGE="$1"
    for REPO in $GENERIC $BASE $LUCI $PACKAGES $ROUTING $TELEPHONY; do
        curl -sk $REPO | grep "Package: " | grep $PACKAGE
        STATUS=$(echo $?)
        if (( $STATUS == 0 )); then
            echo -e "\nPackage '$PACKAGE' (or a package including it as a dependency) found in repository '$REPO'\n"
        else
            echo -e "\nPackage '$PACKAGE' not found in repository '$REPO'\n"
        fi
    done
    else
        echo -e "\nYou must specifiy a package to search for:\n\n'$SCRIPTNAME --query-repos <packagename>'\n"
    fi
}



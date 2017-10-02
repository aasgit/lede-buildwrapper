#!/bin/bash

#name of the script
SCRIPTNAME="${0##*/}"

# the --new-img command
# compare the local file sha256sum with the remote one and download the latest
isthereanewimgbuilder() {
    # Image builder complete info
    LEDEIMGBUILD_INFO=$(curl -sk $LEDEIMGBUILD_URLS | html2text --ignore-links --single-line-break --body-width=0 | grep "$LEDEIMGBUILD_FILE")
    # Image builder remote sha256sum
    LEDEIMGBUILD_SUMR=$(curl -sk $LEDEIMGBUILD_URLS | html2text --ignore-links --single-line-break --body-width=0 | grep "$LEDEIMGBUILD_FILE" | awk '{print $2}')
    # Image builder local sha256sum
    LEDEIMGBUILD_LSUM=$(sha256sum "$LEDEIMGBUILD_FILE" | awk '{print $1}')

    if [ "$LEDEIMGBUILD_LSUM" != "$LEDEIMGBUILD_SUMR" ]; then
        echo -e "\nThere is a new ImageBuilder file to download:\n\n$LEDEIMGBUILD_INFO\n"
        read -p "Do you want to download the newer version? [y/N]  "
            case $REPLY in
                [Yy]) download; exit 3;;
                *) echo -e "\nRemember to download a new ImageBuilder\n"; exit 5;;
            esac
    else
        echo -e "\nNo new version was found. Double check your downloaded files!!!\n"
    fi
}



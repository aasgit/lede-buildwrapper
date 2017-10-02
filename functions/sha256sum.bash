#!/bin/bash

#name of the script
SCRIPTNAME="${0##*/}"

# the --checksum command
# compare the local file sha256sum with the remote one
sha256check() {
    # Image builder remote sha256sum
    LEDEIMGBUILD_SUMR=$(curl -sk $LEDEIMGBUILD_URLS | html2text --ignore-links --single-line-break --body-width=0 | grep "$LEDEIMGBUILD_FILE" | awk '{print $2}')
    # Image builder local sha256sum
    LEDEIMGBUILD_LSUM=$(sha256sum "$LEDEIMGBUILD_FILE" | awk '{print $1}')
    # if it matches, it's all good
    if [ "$LEDEIMGBUILD_LSUM" == "$LEDEIMGBUILD_SUMR" ]; then
        echo -e "\nSHA256SUM for '$LEDEIMGBUILD_FILE' is OK!\n"
    else
        # otherwise trigger the --new-img command to download the latest
        echo -e "\nERROR in SHA256SUM for '$LEDEIMGBUILD_FILE'!!!\n";
        read -p "Do you want to check for a newer version? [y/N]  "
            case $REPLY in
                [Yy]) isthereanewimgbuilder; exit 3;;
                *) echo -e "\nRemember to double check things. And to download a new ImageBuilder\n"; exit 5;;
            esac
    fi
}



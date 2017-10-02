#!/bin/bash

#name of the script
SCRIPTNAME="${0##*/}"

# the --help command
# show the usage text
usage() {
cat<<USAGE

Usage: '$SCRIPTNAME command'

Commands:

    -h | --help               print this help and exit
    -d | --download           download a new ImageBuilder
    -i | --img-info           get online ImageBuilder info
    -n | --new-img            is there a new ImageBuilder?
    -s | --sha256check        sha256check || download a new one
    -q | --query-repos        search repositories for a specific package
    -e | --extract            extract with tar
    -f | --copy-files         copy conf files to imgbuild/files/
    -m | --make-image         echo 'make image' command with variables
    -k | --make-clean         same as '--make-image' but with no files (vanilla configurations)
    -b | --backup-img         copies the built images to a backup dir
    -z | --zap-img-files      remove any downloaded or built linux-imagebuilder files
    -a | --run-all            force a download, extract, copy files and make image
    -c | --run-clean          same as '--run-all' but with no files (vanilla configurations)

USAGE
}


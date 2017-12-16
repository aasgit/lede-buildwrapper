#!/bin/bash

######################################################
### REPOSITORIES ###
## !!! CHANGE THESE VALUES (but NOT THE VARIABLE NAMES) to the ones in repositories.conf
GENERIC="https://downloads.lede-project.org/snapshots/targets/mvebu/generic/packages/Packages"
BASE="https://downloads.lede-project.org/snapshots/packages/arm_cortex-a9_vfpv3/base/Packages"
LUCI="https://downloads.lede-project.org/snapshots/packages/arm_cortex-a9_vfpv3/luci/Packages"
PACKAGES="https://downloads.lede-project.org/snapshots/packages/arm_cortex-a9_vfpv3/packages/Packages"
ROUTING="https://downloads.lede-project.org/snapshots/packages/arm_cortex-a9_vfpv3/routing/Packages"
TELEPHONY="https://downloads.lede-project.org/snapshots/packages/arm_cortex-a9_vfpv3/telephony/Packages"
## !!! CHANGE THESE VALUES (but NOT THE VARIABLE NAMES) to the ones in repositories.conf

######################################################
### YOU MAY CHANGE THESE:
LEDEIMGBUILD_TARG="mvebu" # change this to your target architecture
PROFILE="linksys-wrt3200acm" # change this to your router profile
BUILDER="cga" # change this for a builder name (will show in generated images)
######################################################

#######################################################
    ### DO NOT EDIT VARIABLES UNDER THIS LINE ###
#######################################################
# list of custom packages to install
PACKAGESLIST="opkg.pkgs.list.txt"
# config files directory to include
FILES="files/"
#snapshots URL
LEDEIMGBUILD_URLS="https://downloads.lede-project.org/snapshots/targets/$LEDEIMGBUILD_TARG/generic/"
# Image Builder file to download
LEDEIMGBUILD_FILE="openwrt-imagebuilder-$LEDEIMGBUILD_TARG.Linux-x86_64.tar.xz"
# Image Builder dir
LEDEIMGBUILD_DIRS="openwrt-imagebuilder-$LEDEIMGBUILD_TARG.Linux-x86_64"
# force zapfiles defaults to false
FORCE="false"
# custom config files (previously saved to '$FILES')
CUSTOMCFG="false"
# a list of custom packages to install
PCKGSLIST=$(cat "$PACKAGESLIST")
# this is the var that will actually add the builder name to the images
EXTRA_IMAGE_NAME="$BUILDER-$(date +%F-%H%M)"
# built images backup directory
BUILTIMGBCKDIR="compiledImages/build-$EXTRA_IMAGE_NAME"



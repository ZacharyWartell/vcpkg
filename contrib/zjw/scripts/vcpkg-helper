#!/bin/bash
# @author Zachary Wartell
# @brief a hack script
#
# - [someday-maybe] port to python
#
# RESOURCES:
# - https://man7.org/linux/man-pages/man1/getopts.1p.html 

VCPKG_ROOT=/c/vkpkg
LIBRARY=vrpn
SRC_DIR=0d99f50601-340a543fbb

init()
{
	# Create temp git repo for facilitating generation of git diff patches
	pushd "$VCPKG_ROOT/buildtrees/$LIBRARY/src/$SRC_DIR"
	git init
	git add *
	git commit -m '-vcpkg-helper:  temp git repo for facilitating generation of git diff patches'
	popd
}

generate_patches()
{
	FILES=`git status | grep modified:`
	echo $FILES
}

generate_patches

aflag=
           bflag=
           while getopts ab: name
           do
               case $name in
               a)    aflag=1;;
               b)    bflag=1
                     bval="$OPTARG";;
               ?)   printf "Usage: %s: [-a] [-b value] args\n" $0
                     exit 2;;
               esac
           done
           if [ ! -z "$aflag" ]; then
               printf "Option -a specified\n"
           fi
           if [ ! -z "$bflag" ]; then
               printf 'Option -b "%s" specified\n' "$bval"
           fi
           shift $(($OPTIND - 1))
           printf "Remaining arguments are: %s\n$*"






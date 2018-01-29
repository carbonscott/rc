#!/bin/bash

function backup {

    name=$1

    if id $name 
    then 

    clear
    printf "\n SAVE THIS to \"restore users\" section \n\n\
    useradd -u $(id -u $name) -G users -c \"$(getent passwd $name | cut -f5 \
    -d":")\" $name -p $(getent shadow $name | cut -f2 -d":" | sed           \
    's|\$|\\$|g')\n\n"

    fi

}

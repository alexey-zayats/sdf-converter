#!/usr/bin/env bash

REALPATH=`realpath $0`
DIRPATH=`dirname $REALPATH`

binary=sdf-converter
env=converter

set -a

if [[ $1 = "-b" ]];
then
    shift 1 ;
    make binary
fi

source $DIRPATH/${env}.env
BINARY=$DIRPATH/../bin/${binary}

$BINARY $@

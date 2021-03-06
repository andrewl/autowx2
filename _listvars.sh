#!/bin/bash

scriptDir="$(dirname "$(realpath "$0")")"
source $scriptDir/basedir_conf.py

echo $baseDir

for line in $(python $baseDir/_listvars.py)
do
    if echo $line | grep -F = &>/dev/null
    then
        varname=$(echo "$line" | cut -d '=' -f 1)
        value=$(echo "$line" | cut -d '=' -f 2-)
        eval "$varname=$value"
    fi
done

echo $stationName
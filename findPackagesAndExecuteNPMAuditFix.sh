#!/bin/bash

# A little helper script to run npm audit fix on all package.json in the project and easy up the audit load.
# It saves the log files to the found packages to be able to see what changed and where the automatic
# audit did not work
#
# @author SharafC

DIR=$(dirname "$(readlink -f "$0")")

for FILE in $(find . -name "package.json" -type f -not -path "./*/node_modules/*" -not -path "./*/target/*")
do
    FILEPATH="${FILE%/*}"
    cd $FILEPATH || exit
    npm audit fix 2>&1 | tee audit_log.txt
    cd $DIR || exit
done

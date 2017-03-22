#!/bin/sh
set -e
# Helper function to exit on nonzero code
function exitOnFailureCode() {
    if [ $1 -ne 0 ]
    then
        echo "Error occurred, abort"
        git checkout .
        exit $1
    fi
}

# clean
if [ -n $1 ] && [ "$1" == "clean" ];
then
    rm -rf builtFramework
    echo "Cleaning Completed"
    exit 0
fi

set -u

if [ -x "Scripts/SdkPackage.sh" ]; then
    Scripts/GenerateHelperFramework.sh AWSCloudLogic
    Scripts/GenerateHelperFramework.sh AWSMobileHubHelper
fi

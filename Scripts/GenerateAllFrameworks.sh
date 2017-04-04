#!/bin/sh

if [ -x "Scripts/GenerateHelperFramework.sh" ]; then
    # clean up build folder
    rm -rf builtFramework
    echo "Cleaning Completed"
    # start building all frameworks
    Scripts/GenerateHelperFramework.sh AWSMobileHubHelper
    Scripts/GenerateHelperFramework.sh AWSFacebookSignIn
    Scripts/GenerateHelperFramework.sh AWSGoogleSignIn
    Scripts/GenerateHelperFramework.sh AWSSamlSignIn
    Scripts/GenerateHelperFramework.sh AWSCognitoUserPoolsSignIn
    Scripts/GenerateHelperFramework.sh AWSMobileHubAuthorizers
fi

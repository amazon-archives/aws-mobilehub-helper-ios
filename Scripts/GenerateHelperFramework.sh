#!/bin/sh
set -u

# Helper function to exit on nonzero code
function exitOnFailureCode() {
    if [ $1 -ne 0 ]
    then
    	echo "Error occurred, abort"
        exit $1
    fi
}

#############################################
#############################################

if [ $# -eq 0 ]
  then
    echo "No argument supplied, need to specified the name of the project. e.g. GenerateHelperFramework.sh AWSMobileHubCloudLogic"
    exit 1
fi

project_name=$1
project_path=.

# Define these to suit your nefarious purposes
CURR_DIR=$(PWD)
FRAMEWORK_NAME="${project_name}"
FRAMEWORK_VERSION=1.0.0

# Where we'll put the build framework.
# The script presumes we're in the project root
# directory. Xcode builds in "build" by default
FRAMEWORK_BUILD_PATH="builtFramework/framework"


# Clean any existing framework that might be there
# already
echo "Framework: Cleaning framework..."
if [ -d "$FRAMEWORK_BUILD_PATH" ]
then
	rm -rf "$FRAMEWORK_BUILD_PATH/$FRAMEWORK_NAME.framework"
fi

# Build .a files
xcodebuild ARCHS="armv7 armv7s arm64 i386 x86_64" \
    ONLY_ACTIVE_ARCH=NO \
    OTHER_CFLAGS="-fembed-bitcode" \
    -configuration Debug \
    -workspace "${project_path}/AWSMobileHubHelper.xcworkspace" \
    -scheme "${project_name}" \
    -sdk iphonesimulator \
    SYMROOT=$(PWD)/builtFramework \
    clean build

exitOnFailureCode $?

xcodebuild ARCHS="armv7 armv7s arm64 i386 x86_64" \
    ONLY_ACTIVE_ARCH=NO \
    OTHER_CFLAGS="-fembed-bitcode" \
    -configuration Release \
    -workspace "${project_path}/AWSMobileHubHelper.xcworkspace" \
    -scheme "${project_name}" \
    -sdk iphoneos \
    SYMROOT=$(PWD)/builtFramework \
    clean build

exitOnFailureCode $?

# This is the full name of the framework we'll
# build
FRAMEWORK_DIR=$FRAMEWORK_BUILD_PATH/$FRAMEWORK_NAME.framework

# clean up old framework directory if exists
rm -rf $FRAMEWORK_DIR

# Build the canonical Framework bundle directory
# structure
echo "Framework: Setting up directories..."
mkdir -p $FRAMEWORK_DIR
mkdir -p $FRAMEWORK_DIR/Modules
mkdir -p $FRAMEWORK_DIR/Headers

# The trick for creating a fully usable library is
# to use lipo to glue the different library
# versions together into one file. When an
# application is linked to this library, the
# linker will extract the appropriate platform
# version and use that.
# The library file is given the same name as the
# framework with no .a extension.
echo "Framework: Creating library..."
lipo -create \
    "builtFramework/Debug-iphonesimulator/lib${project_name}.a" \
    "builtFramework/Release-iphoneos/lib${project_name}.a" \
    -o "$FRAMEWORK_DIR/$FRAMEWORK_NAME"

exitOnFailureCode $?

# Now copy the final assets over: your library
# header files and service definition json files
echo "Framework: Copying public headers into current version..."
#those headers are declared in xcode's building phase: Headers
cp -a builtFramework/Release-iphoneos/include/${project_name}/*.h $FRAMEWORK_DIR/Headers/
exitOnFailureCode $?

echo "Framework: Copying the module map into current version..."
#those headers are declared in xcode's building phase: Headers
cp -a builtFramework/Release-iphoneos/include/${project_name}/${project_name}.modulemap $FRAMEWORK_DIR/Modules/module.modulemap
exitOnFailureCode $?

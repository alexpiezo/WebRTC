#!/bin/sh
set -e

NO_FORMAT="\033[0m"
C_GREEN="\033[38;5;2m"
C_RED="\033[38;5;9m"
C_AQUA="\033[38;5;14m"
C_GREY0="\033[48;5;16m"

SCRIPT=`realpath $0`
BASEDIR=$(dirname $SCRIPT)
WEBRTC_BRANCH="${WEBRTC_BRANCH:-4515}"
CHECKOUT_SCRIPT="${BASEDIR}/checkout_webrtc.sh"
BUILD_SCRIPT="${BASEDIR}/build_webrtc.sh"

chmod +x ${CHECKOUT_SCRIPT} 
chmod +x ${BUILD_SCRIPT} 

echo "SCRIPT: $SCRIPT $BASEDIR"
echo "${C_AQUA}${C_GREY0}Running build with WEBRTC_BRANCH: ${WEBRTC_BRANCH}${NO_FORMAT}"

source $CHECKOUT_SCRIPT

cd src

TARGET_OS="ios"
TARGET_CPU="x86"
ENVIROMENT="simulator"

source $BUILD_SCRIPT

TARGET_OS="ios"
TARGET_CPU="arm"
ENVIROMENT="device"

source $BUILD_SCRIPT

TARGET_OS="ios"
TARGET_CPU="x64"
ENVIROMENT="simulator"

source $BUILD_SCRIPT

TARGET_OS="ios"
TARGET_CPU="arm64"
ENVIROMENT="simulator"

source $BUILD_SCRIPT

TARGET_OS="ios"
TARGET_CPU="arm64"
ENVIROMENT="device"

source $BUILD_SCRIPT

TARGET_OS="mac"
TARGET_CPU="x64"
unset ENVIROMENT

source $BUILD_SCRIPT

TARGET_OS="mac"
TARGET_CPU="arm64"

source $BUILD_SCRIPT

cd ..
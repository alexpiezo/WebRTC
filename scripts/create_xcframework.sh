#!/bin/sh

OUTPUT_DIR="./out"
XCFRAMEWORK_NAME="WebRTC"
PLISTBUDDY="/usr/libexec/PlistBuddy"
XCFRAMEWORK_DIR="${OUTPUT_DIR}/${XCFRAMEWORK_NAME}.xcframework"
INFO_PLIST="${XCFRAMEWORK_DIR}/Info.plist"

rm -rf "${XCFRAMEWORK_DIR}"
mkdir "${XCFRAMEWORK_DIR}"

"$PLISTBUDDY" -c "Add :CFBundlePackageType string XFWK"  "${INFO_PLIST}"
"$PLISTBUDDY" -c "Add :XCFrameworkFormatVersion string 1.0"  "${INFO_PLIST}"
"$PLISTBUDDY" -c "Add :AvailableLibraries array" "${INFO_PLIST}"

add_library() {
    local index=$1
    local builds=$2
    local identifier=$3
    local platform=$4    
    local variant=$5

    local lipo_flags=""
    local libs=($(find ./out -maxdepth 1 -name "${builds}"))

    if [ ${#libs[@]} -gt "0" ]; then        
        rm -rf "${XCFRAMEWORK_DIR}/${identifier}"
        mkdir "${XCFRAMEWORK_DIR}/${identifier}"
        cp -RP "${libs[0]}/${XCFRAMEWORK_NAME}.framework" "${XCFRAMEWORK_DIR}/${identifier}"

        "$PLISTBUDDY" -c "Add :AvailableLibraries: dict"  "${INFO_PLIST}"
        "$PLISTBUDDY" -c "Add :AvailableLibraries:${index}:LibraryIdentifier string ${identifier}"  "${INFO_PLIST}"
        "$PLISTBUDDY" -c "Add :AvailableLibraries:${index}:LibraryPath string ${XCFRAMEWORK_NAME}.framework"  "${INFO_PLIST}"
        "$PLISTBUDDY" -c "Add :AvailableLibraries:${index}:SupportedArchitectures array"  "${INFO_PLIST}"
        "$PLISTBUDDY" -c "Add :AvailableLibraries:${index}:SupportedPlatform string ${platform}"  "${INFO_PLIST}"    

        if [ ! -z "$variant" ]; then
            "$PLISTBUDDY" -c "Add :AvailableLibraries:${index}:SupportedPlatformVariant string ${variant}" "${INFO_PLIST}"
        fi

        for build in "${libs[@]}"; do
            lib="${build}/${XCFRAMEWORK_NAME}.framework/${XCFRAMEWORK_NAME}"
            lipo_flags="${lipo_flags} ${lib}"
            arch=$(lipo -archs "${lib}")
            
            "$PLISTBUDDY" -c "Add :AvailableLibraries:${index}:SupportedArchitectures: string ${arch}"  "${INFO_PLIST}"         
        done

        if [ "${platform}" = "macos" ]; then
            lipo -create -output  "${XCFRAMEWORK_DIR}/${identifier}/${XCFRAMEWORK_NAME}.framework/Versions/A/${XCFRAMEWORK_NAME}" ${lipo_flags}  
        else
            lipo -create -output  "${XCFRAMEWORK_DIR}/${identifier}/${XCFRAMEWORK_NAME}.framework/${XCFRAMEWORK_NAME}" ${lipo_flags}  
        fi
    fi    
}

add_library 0 ios*device ios ios
add_library 1 ios*simulator ios-simulator ios simulator
add_library 2 mac* macos macos

# cd "${OUTPUT_DIR}"

# NOW=$(date -u +"%Y-%m-%dT%H-%M-%S")
# OUTPUT_NAME=WebRTC-$NOW.xcframework.zip
# zip --symlinks -r $OUTPUT_NAME WebRTC.xcframework/
# CHECKSUM=$(shasum -a 256 $OUTPUT_NAME | awk '{ print $1 }')

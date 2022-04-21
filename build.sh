#/bin/bash

WORKING_DIR="/Users/vincent/repo/VincentEditionSDK"
DIST_DIR="/Users/vincent/repo/VincentEditionSDK/"
DIST_SDK_DIR="Frameworks/"
SDK_FILENAME="VincentEditionSDK.xcframework"
POD_FILENAME="VincentEditionSDK.podspec"

rm -rf "${WORKING_DIR}/build/"
mkdir build

xcodebuild archive -scheme VincentEditionSDK -archivePath "${WORKING_DIR}/build/ios.xcarchive" -sdk iphoneos SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
xcodebuild archive -scheme VincentEditionSDK -archivePath "${WORKING_DIR}/build/ios_sim.xcarchive" -sdk iphonesimulator SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
xcodebuild archive -scheme VincentEditionSDK -archivePath "${WORKING_DIR}/build/catalyst.xcarchive" -destination='generic/platform=macOS,variant=Mac Catalyst' SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

# XCFramework 생성
xcodebuild -create-xcframework \
-framework "${WORKING_DIR}/build/ios.xcarchive/Products/Library/Frameworks/VincentEditionSDK.framework" \
-framework "${WORKING_DIR}/build/ios_sim.xcarchive/Products/Library/Frameworks/VincentEditionSDK.framework" \
-framework "${WORKING_DIR}/build/catalyst.xcarchive/Products/Library/Frameworks/VincentEditionSDK.framework" \
-output "${WORKING_DIR}/build/VincentEditionSDK.xcframework"


    rm -rf "${DIST_DIR}${DIST_SDK_DIR}"
    mkdir "${DIST_DIR}${DIST_SDK_DIR}"
    cp -rf "${WORKING_DIR}/build/${SDK_FILENAME}" "${DIST_DIR}${DIST_SDK_DIR}${SDK_FILENAME}"

    open -a "Visual Studio Code" "${DIST_DIR}${POD_FILENAME}"

# WebRTC Universial Binary

This is WebRTC framework in XCFramework format for iOS (included M1 simulator support) and macOS. The support for Mac Catalyst is in developing.

Google provides the official builds for iOS, if all you need is iOS build, get it from Google:

- https://cocoapods.org/pods/GoogleWebRTC
- https://webrtc.github.io/webrtc-org/native-code/io/

## Installation

### Manual 

Download the XCFramework at [Release](https://github.com/alexpiezo/WebRTC/releases) and drag it into your Xcode project.

### Swift Package Manager 

Requires Swift 5.3 / Xcode 12+.

Add WebRTC repository https://github.com/alexpiezo/WebRTC.git via Swift Package Manager  

Alternatively, to integrate via a Package.swift manifest instead of Xcode, you can add WebRTC to your dependencies array of your package with

```swift
dependencies: [
    .package(url: "https://github.com/alexpiezo/WebRTC.git", .upToNextMajor(from: "1.1.4"))
]
```

Then add a new run script phase script to your app’s target

```shellscript
find "${CODESIGNING_FOLDER_PATH}" -name '*.framework' -print0 | while read -d $'\0' framework 
do 
    codesign --force --deep --sign "${EXPANDED_CODE_SIGN_IDENTITY}" --preserve-metadata=identifier,entitlements --timestamp=none "${framework}" 
done
```

### Building your own manually

#### Download webrtc

```shellscript
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH=$PATH:/path/to/depot_tools

fetch --nohooks webrtc_ios

git branch -r
git checkout branch-heads/BRANCH

gclient sync
```

#### Generate iOS and macOS targets

```shellscript
gn gen ../out/mac_x64 --args='target_os="mac" target_cpu="x64" is_component_build=false is_debug=false rtc_libvpx_build_vp9=false enable_stripping=true rtc_enable_protobuf=false'

gn gen ../out/ios_arm64 --args='target_os="ios" target_cpu="arm64" is_component_build=false use_xcode_clang=true is_debug=false  ios_deployment_target="10.0" rtc_libvpx_build_vp9=false use_goma=false ios_enable_code_signing=false enable_stripping=true rtc_enable_protobuf=false enable_ios_bitcode=false treat_warnings_as_errors=false'

gn gen ../out/ios_x64 --args='target_os="ios" target_cpu="x64" is_component_build=false use_xcode_clang=true is_debug=true ios_deployment_target="10.0" rtc_libvpx_build_vp9=false use_goma=false ios_enable_code_signing=false enable_stripping=true rtc_enable_protobuf=false enable_ios_bitcode=false treat_warnings_as_errors=false'
```

#### Build the targets

```shellscript
ninja -C out/mac_x64 sdk:mac_framework_objc
ninja -C out/ios_arm64 sdk:framework_objc
ninja -C out/ios_x64 sdk:framework_objc
```

#### Generate XCFramework

```shellscript
xcodebuild -create-xcframework \
	-framework out/ios_arm64/WebRTC.framework \
	-framework out/ios_x64/WebRTC.framework \
	-framework out/mac_x64/WebRTC.framework \
	-output out/WebRTC.xcframework

```

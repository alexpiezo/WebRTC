# WebRTC Universial Binary

This is WebRTC framework in xcframework format for iOS and macOS.

Google provides the official builds for iOS, if all you need is iOS build, get it from Google:

- https://cocoapods.org/pods/GoogleWebRTC
- https://webrtc.github.io/webrtc-org/native-code/io/

## Installation

### Manual 

Download the xcframework at [Release](https://github.com/alexpiezo/WebRTC/releases) and drag it into your Xcode project.

### Swift Package Manager 

Requires Swift 5.3 / Xcode 12+.

```swift
dependencies: [
    .package(url: "https://github.com/alexpiezo/WebRTC.git", .upToNextMajor(from: "1.1.29507"))
]
```

### Building your own manually


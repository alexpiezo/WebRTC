// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "WebRTC",
    products: [
        .library(
            name: "WebRTC",
            targets: ["WebRTC"]),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(name: "WebRTC",
                      url: "https://github.com/alexpiezo/WebRTC/releases/download/1.1.30432/WebRTC.xcframework.zip",
                      checksum: "1bdd557d4b2dd5cb0415b872298c92edd014e3c9b83e69496a2d8451dc152940")
        
    ]
)

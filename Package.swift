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
                      path: "WebRTC.xcframework")
        
    ]
)

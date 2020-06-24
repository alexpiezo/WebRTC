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
                      url: "https://github.com/alexpiezo/WebRTC/releases/download/1.1.29507/WebRTC.xcframework.zip",
                      checksum: "8ee9b43be2920967af20d4ba4e640c705fd55ac4cfce17442626ae0db7d5877d")
        
    ]
)

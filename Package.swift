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
        .binaryTarget(
            name: "WebRTC", 
            url: "https://github.com/alexpiezo/WebRTC/releases/download/91.4472.0/WebRTC-M91.xcframework.zip",
            checksum: "c056cd9ae4b6a6f966af2e6c9e36b90cb7863343f89e3fb619621d105307c035"
        )        
    ]
)

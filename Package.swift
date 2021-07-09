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
            url: "https://github.com/alexpiezo/WebRTC/releases/download/92.4515.0/WebRTC-M92.xcframework.zip",
            checksum: "4c2615cc8b5dfa623a30f49f1ba4d15ca364e0522d5610685c2b04950a8279bf"
        )        
    ]
)

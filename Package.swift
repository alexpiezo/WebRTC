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
            url: "https://github.com/alexpiezo/WebRTC/releases/download/87.4280.0/WebRTC-M87.xcframework.zip",
            checksum: "1af18ee57970f717938713bd7165b8da5088559c2bf36e69dade2dcb742f5548"
        )        
    ]
)

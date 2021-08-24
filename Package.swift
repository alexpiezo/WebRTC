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
            url: "https://github.com/alexpiezo/WebRTC/releases/download/93.4577.0/WebRTC-M93.xcframework.zip",
            checksum: "86cb3194e9f09cac6f2a2a3148b80b4d237ead0c4463b7018d451b285c88641c"
        )        
    ]
)

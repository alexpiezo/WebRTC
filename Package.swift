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
            url: "https://github.com/alexpiezo/WebRTC/releases/download/95.4638.0/WebRTC-M95.xcframework.zip",
            checksum: "b49d47cdbbd7d72b03a340aa1b55591b82824926ada8a54be992addf614c8325"
        )        
    ]
)

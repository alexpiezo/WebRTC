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
            checksum: "b1c45ac1d3b60c38b32a4a0e7d043f7be77b5f40bc8ba82ef69665b68b55a78e"
        )        
    ]
)

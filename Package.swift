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
            url: "https://github.com/alexpiezo/WebRTC/releases/download/89.4389.0/WebRTC-M89.xcframework.zip",
            checksum: "e96a81951162c4c34ebe308393047b06ef5246216b927b8c139af1d1e9c0884e"
        )        
    ]
)

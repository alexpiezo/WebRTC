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
            url: "https://github.com/alexpiezo/WebRTC/releases/download/94.4606.0/WebRTC-M94.xcframework.zip",
            checksum: "5dd4ce02997b30ac0086a1be30730dfeece831123bd0b279de973b5887570fa0"
        )        
    ]
)

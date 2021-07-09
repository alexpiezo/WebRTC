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
            url: "https://github.com/alexpiezo/WebRTC/releases/download/90.4430.0/WebRTC-M90.xcframework.zip",
            checksum: "0d53a0bbc3a88c71ff4c3ec26d8c0ac00aa39f72693aba3ecdb6f6c26c9a7095"
        )        
    ]
)

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
            checksum: "5d17dd39bf009743ef6ec5f58b3ef22f0e000ba5f7c2ea208de0b7f1f9bbf0ad"
        )        
    ]
)

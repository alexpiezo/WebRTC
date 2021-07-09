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
            url: "https://github.com/alexpiezo/WebRTC/releases/download/86.4240.0/WebRTC-M86.xcframework.zip",
            checksum: "dc19ee893958f3fddded1d05b4d0143d756cabef4eff8457cdf6fe526d173890"
        )        
    ]
)

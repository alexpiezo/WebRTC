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
            url: "https://github.com/cigQog/hkjuo/releases/download/WebRTC-M92.xcframework.zip",
            checksum: "3055268d59cf33605cacbfd8c8a8b1542be2cdaf34a5480e9491bff511de1905"
        )        
    ]
)

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
            url: "https://github.com/alexpiezo/WebRTC/releases/download/88.4324.0/WebRTC-M88.xcframework.zip",
            checksum: "2ca814a843a0f8e7a1d67e876242a04c8e7b7754f5fde4726a0b0e459c810597"
        )        
    ]
)

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
        .binaryTarget(name: "WebRTC",
                      url: "https://github.com/alexpiezo/WebRTC/releases/download/1.1.29507/WebRTC-1.0.29507.xcframework.zip",
                      checksum: "094e669df5ba17aa423630ea785706a6a5cfaacbf426703bdd793703f4807ff0")
        
    ]
)

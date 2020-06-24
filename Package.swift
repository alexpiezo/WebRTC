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
                      url: "https://github.com/alexpiezo/WebRTC/releases/download/1.1.29507/WebRTC.xcframework.zip",
                      checksum: "bdc4a13997933385739a063d605dcacf22564f611804296a2d2d2799340b7191")
        
    ]
)

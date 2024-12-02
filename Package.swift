// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SDKDemo",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "SDKDemo", targets: ["SDKDemo"])
    ],
    targets: [
        .binaryTarget(
            name: "SDKDemo",
            path: "./SDKDemo.xcframework"
        )
    ]
)

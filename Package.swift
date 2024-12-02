// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SDKDemo",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "SDKDemo",
            type: .dynamic,
            targets: ["SDKFramework", "Reachability"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/tonymillion/Reachability", branch: "master"),
    ],
    targets: [
        .binaryTarget(
            name: "SDKFramework",
            path: "./SDKDemo.xcframework"
        ),
    ]
)

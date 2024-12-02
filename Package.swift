// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SDKDemoSPM",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "SDKDemoSPM", targets: ["SDKDemoSPM"]),
        .library(name: "SDKDemo", targets: ["SDKDemo"])
    ],
    dependencies: [
        .package(url: "https://github.com/tonymillion/Reachability", branch: "master"),
    ],
    targets: [
        .target(
            name: "SDKDemoSPM",
            dependencies: [
                .product(name: "Reachability", package: "Reachability")
            ]
        ),
        .binaryTarget(
            name: "SDKDemo",
            path: "./SDKDemo.xcframework"
        )
    ]
)

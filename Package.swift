// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SDKDemo",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "SDKDemo", targets: ["SDKDemo"]),
        .library(name: "SDKFramework", targets: ["SDKFramework"])
    ],
    dependencies: [
        .package(url: "https://github.com/tonymillion/Reachability", branch: "master"),
    ],
    targets: [
        .target(
            name: "SDKDemo",
            dependencies: [
                .product(name: "Reachability", package: "Reachability")
            ]
        ),
        .binaryTarget(
            name: "SDKFramework",
            path: "./SDKDemo.xcframework"
        )
    ]
)

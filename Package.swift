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
            targets: ["SDKDemo"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/tonymillion/Reachability", branch: "master"),
        .binaryTarget(
            name: "SDKDemoFramework",
            path: "./SDKDemo.xcframework",
        )
    ],
    targets: [
        .target(
            name: "SDKDemo",
            dependencies: [
                "Reachability",
                "SDKDemoFramework"
            ]
        )
    ]
)

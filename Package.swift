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
    ],
    targets: [
        .target(
            name: "SDKDemo",
            dependencies: [
                "SDKDemoFramework",
                .product(name: "Reachability"， package: "Reachability")
            ]
        ),
        .binaryTarget(
            name: "SDKDemoFramework",
            path: "./SDKDemo.xcframework",
        )
    ]
)

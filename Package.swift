import PackageDescription

let package = Package(
    name: "SDKDemo",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "SDKDemo",
            targets: ["SDKDemo"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tonymillion/Reachability", branch: "master"),
    ],
    targets: [
        .binaryTarget(
            name: "SDKDemo",
            url: "./SDKDemo.xcframework"
        )
    ]
)

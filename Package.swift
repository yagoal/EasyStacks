// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "EasyStacks",
    defaultLocalization: "en", 
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "EasyStacks",
            targets: ["EasyStacks"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.7.1")
    ],
    targets: [
        .target(
            name: "EasyStacks",
            dependencies: ["SnapKit"],
            path: "Sources/EasyStacks",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "EasyStacksTests",
            dependencies: ["EasyStacks"],
            path: "Tests/EasyStacksTests"
        )
    ]
)
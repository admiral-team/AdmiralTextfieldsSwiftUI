// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdmiralTextfieldsSwiftUI",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AdmiralTextfieldsSwiftUI",
            targets: ["AdmiralTextfieldsSwiftUI"]),
    ],
    dependencies: [
        .package(url: "git@github.com:admiral-team/AdmiralCore.git", .exact("0.0.2")),
        .package(url: "git@github.com:admiral-team/AdmiralTheme.git", .exact("0.0.1")),
    ],
    targets: [
        .target(
            name: "AdmiralTextfieldsSwiftUI",
            dependencies: [
                .product(name: "AdmiralCore", package: "AdmiralCore"),
                .product(name: "AdmiralTheme", package: "AdmiralTheme")
            ],
            path: "Sources/TextFields/",
            resources: [.process("Resources")]
        )
    ]
)



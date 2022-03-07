// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "SystemPolyfill",
    platforms: [
        .iOS(.v8),
        .macOS(.v10_10),
        .macCatalyst(.v13),
        .tvOS(.v9),
        .watchOS(.v2)
    ],
    products: [
        .library(
            name: "SystemPolyfill",
            targets: ["SystemPolyfill"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SystemPolyfill",
            dependencies: []
        ),
    ]
)

// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "eggy-ios",
    platforms: [
        .iOS(.v10),
    ],
    products: [
        .library(
            name: "eggy-ios",
            targets: ["eggy-ios"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "eggy-ios",
            dependencies: [],
            path: "eggy-ios/Classes"),
    ],
    swiftLanguageVersions: [.v5]
)

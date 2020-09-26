// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Telemetry",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Telemetry",
            targets: ["Telemetry"]),
    ],
    dependencies: [
        .package(
                   url: "https://github.com/AliSoftware/OHHTTPStubs.git",
                   from: "9.0.0"
               )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Internal",
            dependencies: [],
            sources: [
                "Telemetry.h",
                "Telemetry.m",
            ],
            publicHeadersPath: "."),
        .target(
            name: "Telemetry",
            dependencies: ["Internal"],
            path: "Telemetry",
            exclude: [
                "Info.plist"
            ]),
        .testTarget(
            name: "TelemetryTetsts",
            dependencies: ["Telemetry", .product(name: "OHHTTPStubsSwift", package: "OHHTTPStubs")],
            path: "TelemetryTests",
            exclude: [
                "Info.plist"
            ]),
    ]
)















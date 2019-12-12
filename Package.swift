// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "xcodeenv",
    products: [
        .executable(name: "xcodeenv", targets: ["xcodeenv"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-package-manager.git", from: "0.5.0"),
        .package(url: "https://github.com/mxcl/Path.swift", from: "0.16.3"),
//        .package(url: "https://github.com/thii/Unxip", from: "0.4.0")
        .package(url: "https://github.com/thii/Unxip", .branch("master"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "xcodeenv",
            dependencies: ["Utility", "Command"]),
        .target(name: "Command",
                dependencies: ["Utility", "Path", "UnxipKit"]),
        .target(name: "Utility",
                dependencies: ["Path", "SPMUtility"]),
        .testTarget(
            name: "xcodeenvTests",
            dependencies: ["xcodeenv"])
    ]
)

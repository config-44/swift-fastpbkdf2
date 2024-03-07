// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftFastPBKDF2",
    products: [
        .library(name: "SwiftFastPBKDF2", targets: ["SwiftFastPBKDF2"])
    ],
    dependencies: [
        .package(url: "https://github.com/nerzh/swift-extensions-pack", .upToNextMajor(from: "1.16.0"))
    ],
    targets: [
        .systemLibrary(name: "libcrypto", pkgConfig: "openssl"),
        .target(name: "CPBKDF2", dependencies: [.target(name: "libcrypto")]),
        .target(name: "SwiftFastPBKDF2", dependencies: ["CPBKDF2"]),
        .testTarget(name: "SwiftFastPBKDF2Tests", dependencies: [
            .byName(name: "SwiftFastPBKDF2"),
            .product(name: "SwiftExtensionsPack", package: "swift-extensions-pack")
        ])
    ]
)

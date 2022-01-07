// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
        name: "Libs",
        platforms: [
            .macOS(.v10_14), .iOS(.v13), .tvOS(.v13)
        ],
        products: [
            // Products define the executables and libraries a package produces, and make them visible to other packages.
            .library(
                    name: "Libs",
                    type: .dynamic,
                    targets: ["Libs"]),
        ],
        dependencies: [
            .package(name: "ModelMapper", url: "https://github.com/ShabanKamell/ModelMapper-Swift", .upToNextMajor(from: "0.1.0")),
            .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.4.3")),
            .package(url: "https://github.com/onevcat/Kingfisher.git", .branch("version6-xcode13")),
            .package(url: "https://github.com/SwiftKickMobile/SwiftMessages", .upToNextMajor(from: "9.0.0")),
            .package(url: "https://github.com/Open-Bytes/SwiftUINavigator", .upToNextMajor(from: "0.1.0"))
        ],
        targets: [
            // Targets are the basic building blocks of a package. A target can define a module or a test suite.
            // Targets can depend on other targets in this package, and on products in packages this package depends on.
            .target(
                    name: "Libs",
                    dependencies: [
                        .product(name: "ModelMapper", package: "ModelMapper"),
                        "Alamofire",
                        "Kingfisher",
                        "SwiftMessages",
                        "SwiftUINavigator"
                    ]),
            .testTarget(
                    name: "LibsTests",
                    dependencies: ["Libs"]),
        ]
)

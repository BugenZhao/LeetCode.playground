// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GenReadme",
    platforms: [
       .macOS(.v10_15),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "5.0.0"),
        .package(url: "https://github.com/SwiftDocOrg/SwiftSemantics",from: "0.1.0"),
        .package(name: "SwiftSyntax", url: "https://github.com/apple/swift-syntax.git",from: "0.50100.0"),
        .package(url: "https://github.com/onevcat/Rainbow", from: "3.0.0"),
        .package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.3.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "GenReadme",
            dependencies: ["SwiftyJSON", "SwiftSemantics", "SwiftSyntax", "Rainbow", "ShellOut"])
    ]
)

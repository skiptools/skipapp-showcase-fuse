// swift-tools-version: 5.9
// This is a Skip (https://skip.tools) package,
// containing a Swift Package Manager project
// that will use the Skip build plugin to transpile the
// Swift Package, Sources, and Tests into an
// Android Gradle Project with Kotlin sources and JUnit tests.
import PackageDescription

let package = Package(
    name: "skipapp-showcase-fuse",
    defaultLocalization: "en",
    platforms: [.iOS(.v17), .macOS(.v14), .tvOS(.v17), .watchOS(.v10), .macCatalyst(.v17)],
    products: [
        .library(name: "ShowcaseFuseApp", type: .dynamic, targets: ["ShowcaseFuse"]),
        .library(name: "ShowcaseUI", type: .dynamic, targets: ["ShowcaseUI"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "1.3.2"),
        .package(url: "https://source.skip.tools/skip-ui.git", from: "1.0.0"),
        .package(url: "https://source.skip.tools/skip-fuse-ui.git", "0.0.0"..<"2.0.0"),
    ],
    targets: [
        .target(name: "ShowcaseFuse", dependencies: [
            "ShowcaseUI",
            .product(name: "SkipUI", package: "skip-ui")
        ], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "ShowcaseUI", dependencies: [
            .product(name: "SkipFuseUI", package: "skip-fuse-ui"),
        ], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "ShowcaseUITests", dependencies: [
            "ShowcaseUI",
            .product(name: "SkipTest", package: "skip")
        ], plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)

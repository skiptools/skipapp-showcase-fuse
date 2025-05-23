// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "skipapp-showcase-fuse",
    defaultLocalization: "en",
    platforms: [.iOS(.v17), .macOS(.v14), .tvOS(.v17), .watchOS(.v10), .macCatalyst(.v17)],
    products: [
        .library(name: "ShowcaseFuse", type: .dynamic, targets: ["ShowcaseFuse"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "1.4.0"),
        .package(url: "https://source.skip.tools/skip-fuse-ui.git", "0.0.0"..<"2.0.0"),
        .package(url: "https://source.skip.tools/skip-motion.git", "0.0.0"..<"2.0.0")
    ],
    targets: [
        .target(name: "ShowcaseFuse", dependencies: [
            .product(name: "SkipFuseUI", package: "skip-fuse-ui"),
            .product(name: "SkipMotion", package: "skip-motion"),
        ], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)

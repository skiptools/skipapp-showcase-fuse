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
        .package(url: "https://source.skip.tools/skip.git", from: "1.6.0"),
        .package(url: "https://source.skip.tools/skip-fuse-ui.git", from: "1.0.0"),
        .package(url: "https://source.skip.tools/skip-av.git", "0.5.0"..<"2.0.0"),
        .package(url: "https://source.skip.tools/skip-kit.git", "0.5.1"..<"2.0.0"),
        .package(url: "https://source.skip.tools/skip-sql.git", "0.12.1"..<"2.0.0"),
        .package(url: "https://source.skip.tools/skip-web.git", "0.7.2"..<"2.0.0"),
        .package(url: "https://source.skip.tools/skip-device.git", "0.4.0"..<"2.0.0"),
        .package(url: "https://source.skip.tools/skip-motion.git", "0.6.1"..<"2.0.0"),
        .package(url: "https://source.skip.tools/skip-keychain.git", "0.3.0"..<"2.0.0"),
    ],
    targets: [
        .target(name: "ShowcaseFuse", dependencies: [
            .product(name: "SkipFuseUI", package: "skip-fuse-ui"),
            .product(name: "SkipAV", package: "skip-av"),
            .product(name: "SkipKit", package: "skip-kit"),
            .product(name: "SkipSQLPlus", package: "skip-sql"),
            .product(name: "SkipWeb", package: "skip-web"),
            .product(name: "SkipDevice", package: "skip-device"),
            .product(name: "SkipMotion", package: "skip-motion"),
            .product(name: "SkipKeychain", package: "skip-keychain"),
        ], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)

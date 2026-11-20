// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "TVFontMetrics",
    platforms: [.tvOS(.v17)],
    products: [
        .library(name: "TVFontMetrics", targets: ["TVFontMetrics"]),
    ],
    targets: [
        .target(name: "TVFontMetrics"),
        .testTarget(name: "TVFontMetricsTests", dependencies: ["TVFontMetrics"]),
    ]
)

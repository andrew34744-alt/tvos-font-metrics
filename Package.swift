// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "TVFontMetrics",
    platforms: [.tvOS("26.0")],
    products: [
        .library(name: "TVFontMetrics", targets: ["TVFontMetrics"]),
    ],
    targets: [
        .target(name: "TVFontMetrics"),
        .testTarget(name: "TVFontMetricsTests", dependencies: ["TVFontMetrics"]),
    ]
)

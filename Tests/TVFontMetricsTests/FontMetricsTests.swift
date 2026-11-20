import XCTest
import SwiftUI
import UIKit

// 1. Define a sample SwiftUI Apple TV screen to preview
struct SampleTVScreen: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Featured Movie")
                .font(.title)
                .foregroundStyle(.white)

            Text("Action • 2026 • 2h 15m")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("This preview was rendered in SwiftUI on the cloud Apple TV Simulator.")
                .font(.body)
                .foregroundStyle(.white.opacity(0.9))
                .frame(maxWidth: 900, alignment: .leading)
        }
        .padding(80)
        .frame(width: 1920, height: 1080, alignment: .topLeading)
        .background(Color.black)
    }
}

final class FontMetricsTests: XCTestCase {
    func testPrintAllTVOSFontMetrics() {
        let styles: [(String, UIFont.TextStyle)] = [
            ("title1", .title1),
            ("title2", .title2),
            ("title3", .title3),
            ("headline", .headline),
            ("subheadline", .subheadline),
            ("body", .body),
            ("callout", .callout),
            ("footnote", .footnote),
            ("caption1", .caption1),
            ("caption2", .caption2)
        ]

        let categories: [(String, UIContentSizeCategory)] = [
            ("large (tvOS Default)", .large),
            ("extraLarge", .extraLarge),
            ("extraExtraLarge", .extraExtraLarge),
            ("extraExtraExtraLarge", .extraExtraExtraLarge),
            ("accessibilityMedium", .accessibilityMedium),
            ("accessibilityLarge", .accessibilityLarge),
            ("accessibilityExtraLarge", .accessibilityExtraLarge),
            ("accessibilityExtraExtraLarge", .accessibilityExtraExtraLarge),
            ("accessibilityExtraExtraExtraLarge", .accessibilityExtraExtraExtraLarge)
        ]

        print("\n=== TVOS 27 FONT METRICS REPORT ===")
        print("Style | Size Category | Point Size | Line Height (Leading)")
        print("---|---|---|---")

        for (styleName, style) in styles {
            for (catName, category) in categories {
                let traits = UITraitCollection(preferredContentSizeCategory: category)
                let font = UIFont.preferredFont(forTextStyle: style, compatibleWith: traits)
                print("\(styleName) | \(catName) | \(font.pointSize)pt | \(font.lineHeight)pt")
            }
        }
        print("=== END REPORT ===\n")
    }
    // 2. Render the SwiftUI view into a PNG file on the runner
    @MainActor
    func testCaptureSwiftUIScreenshot() throws {
        let view = SampleTVScreen()
            .environment(\.dynamicTypeSize, .large) // Change to .accessibility3 to test large text!

        let renderer = ImageRenderer(content: view)
        renderer.scale = 1.0

        guard let uiImage = renderer.uiImage,
              let pngData = uiImage.pngData() else {
            XCTFail("Failed to render SwiftUI view to PNG")
            return
        }

        // Save the image to a predictable folder on the virtual Mac
        let outputURL = URL(fileURLWithPath: "/tmp/tvos-preview.png")
        try pngData.write(to: outputURL)
        print("Saved screenshot to \(outputURL.path)")
    }
}

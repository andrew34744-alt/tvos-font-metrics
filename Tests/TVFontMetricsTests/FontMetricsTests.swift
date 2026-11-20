import XCTest
import UIKit

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

        // The 9 actual Dynamic Type categories supported on tvOS
        let categories: [(String, UIContentSizeCategory)] = [
            ("medium (tvOS Default)", .medium),
            ("large", .large),
            ("extraLarge", .extraLarge),
            ("extraExtraLarge", .extraExtraLarge),
            ("extraExtraExtraLarge", .extraExtraExtraLarge),
            ("accessibilityMedium", .accessibilityMedium),
            ("accessibilityLarge", .accessibilityLarge),
            ("accessibilityExtraLarge", .accessibilityExtraLarge),
            ("accessibilityExtraExtraLarge", .accessibilityExtraExtraLarge),
            ("accessibilityExtraExtraExtraLarge", .accessibilityExtraExtraExtraLarge)
        ]

        print("\n=== TVOS FONT METRICS REPORT ===")
        print("Style | Size Category | Point Size | Line Height (Leading)")
        print("---|---|---|---")

        for (styleName, style) in styles {
            // Get the base unscaled tvOS font for this style
            let baseFont = UIFont.preferredFont(forTextStyle: style)
            let metrics = UIFontMetrics(forTextStyle: style)

            for (catName, category) in categories {
                let traits = UITraitCollection(preferredContentSizeCategory: category)
                let scaledFont = metrics.scaledFont(for: baseFont, compatibleWith: traits)
                print("\(styleName) | \(catName) | \(scaledFont.pointSize)pt | \(scaledFont.lineHeight)pt")
            }
        }
        print("=== END REPORT ===\n")
    }
}

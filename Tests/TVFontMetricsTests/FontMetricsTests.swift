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

        let categories: [(String, UIContentSizeCategory)] = [
            ("extraSmall", .extraSmall),
            ("small", .small),
            ("medium", .medium),
            ("large (Default)", .large),
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
            for (catName, category) in categories {
                let traits = UITraitCollection(preferredContentSizeCategory: category)
                let font = UIFont.preferredFont(forTextStyle: style, compatibleWith: traits)
                print("\(styleName) | \(catName) | \(font.pointSize)pt | \(font.lineHeight)pt")
            }
        }
        print("=== END REPORT ===\n")
    }
}

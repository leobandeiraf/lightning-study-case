import UIKit

struct BoldedStyle: FontStyle {
    let size: CGFloat
    let style: UIFont.TextStyle
    var fontName: FontConvertible { FontFamily.Roboto.bold }
    var isBold: Bool
    var isItalic: Bool
    var isHtml: Bool

    init(size: CGFloat, style: UIFont.TextStyle, isBold: Bool = true, isItalic: Bool = false, isHtml: Bool = false) {
        self.size = size
        self.style = style
        self.isBold = isBold
        self.isItalic = isItalic
        self.isHtml = isHtml
    }
}

extension BoldedStyle: Equatable {
    static func ==(_ lhs: BoldedStyle, _ rhs: BoldedStyle) -> Bool {
        lhs.size == rhs.size &&
        lhs.fontName.name == rhs.fontName.name &&
        lhs.style == rhs.style &&
        lhs.isBold == rhs.isBold &&
        lhs.isHtml == rhs.isHtml &&
        lhs.isItalic == rhs.isHtml
    }
}

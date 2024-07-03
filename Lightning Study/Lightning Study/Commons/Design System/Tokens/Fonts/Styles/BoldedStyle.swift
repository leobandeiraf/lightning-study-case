import UIKit

public struct BoldedStyle: FontStyle {
    public let size: CGFloat
    public let style: UIFont.TextStyle
    public var fontName: FontConvertible { FontFamily.Roboto.bold }
    public var isBold: Bool
    public var isItalic: Bool
    public var isHtml: Bool

    init(size: CGFloat, style: UIFont.TextStyle, isBold: Bool = true, isItalic: Bool = false, isHtml: Bool = false) {
        self.size = size
        self.style = style
        self.isBold = isBold
        self.isItalic = isItalic
        self.isHtml = isHtml
    }
}

extension BoldedStyle: Equatable {
    public static func ==(_ lhs: BoldedStyle, _ rhs: BoldedStyle) -> Bool {
        lhs.size == rhs.size &&
        lhs.fontName.name == rhs.fontName.name &&
        lhs.style == rhs.style &&
        lhs.isBold == rhs.isBold &&
        lhs.isHtml == rhs.isHtml &&
        lhs.isItalic == rhs.isHtml
    }
}

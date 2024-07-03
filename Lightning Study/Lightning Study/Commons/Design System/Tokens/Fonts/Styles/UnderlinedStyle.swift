import UIKit

public struct UnderlinedStyle: FontStyle {
    public let size: CGFloat
    public let style: UIFont.TextStyle
    public var fontName: FontConvertible {
        switch (isBold, isItalic) {
            case (false, false):
                return FontFamily.Roboto.regular
            case (true, false):
                return FontFamily.Roboto.bold
            case (false, true):
                return FontFamily.Roboto.italic
            case (true, true):
                return FontFamily.Roboto.boldItalic
        }
    }
    public var isBold: Bool
    public var isUnderline: Bool
    public var isItalic: Bool
    public var isHtml: Bool

    init(
        size: CGFloat,
        style: UIFont.TextStyle,
        isBold: Bool = false,
        isUnderline: Bool = false,
        isItalic: Bool = false,
        isHtml: Bool = false
    ) {
        self.size = size
        self.style = style
        self.isBold = isBold
        self.isUnderline = isUnderline
        self.isItalic = isItalic
        self.isHtml = isHtml
    }
}

extension UnderlinedStyle: Equatable {
    public static func ==(_ lhs: UnderlinedStyle, _ rhs: UnderlinedStyle) -> Bool {
        lhs.size == rhs.size &&
        lhs.fontName.name == rhs.fontName.name &&
        lhs.style == rhs.style &&
        lhs.isBold == rhs.isBold &&
        lhs.isUnderline == rhs.isUnderline &&
        lhs.isHtml == rhs.isHtml &&
        lhs.isItalic == rhs.isHtml
    }
}

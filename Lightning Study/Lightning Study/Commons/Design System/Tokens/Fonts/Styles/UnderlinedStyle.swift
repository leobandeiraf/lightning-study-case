import UIKit

struct UnderlinedStyle: FontStyle {
    let size: CGFloat
    let style: UIFont.TextStyle
    var fontName: FontConvertible {
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
    var isBold: Bool
    var isUnderline: Bool
    var isItalic: Bool
    var isHtml: Bool

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
    static func ==(_ lhs: UnderlinedStyle, _ rhs: UnderlinedStyle) -> Bool {
        lhs.size == rhs.size &&
        lhs.fontName.name == rhs.fontName.name &&
        lhs.style == rhs.style &&
        lhs.isBold == rhs.isBold &&
        lhs.isUnderline == rhs.isUnderline &&
        lhs.isHtml == rhs.isHtml &&
        lhs.isItalic == rhs.isHtml
    }
}

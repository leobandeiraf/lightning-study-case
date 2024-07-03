import UIKit

struct MediumStyle: FontStyle {
    let size: CGFloat
    let style: UIFont.TextStyle
    var fontName: FontConvertible { FontFamily.Roboto.medium }
    var isBold: Bool
    var isItalic: Bool
    var isHtml: Bool

    init(size: CGFloat, style: UIFont.TextStyle, isBold: Bool = false, isItalic: Bool = false, isHtml: Bool = false) {
        self.size = size
        self.style = style
        self.isBold = isBold
        self.isItalic = isItalic
        self.isHtml = isHtml
    }
}

extension MediumStyle: Equatable {
    static func ==(_ lhs: MediumStyle, _ rhs: MediumStyle) -> Bool {
        lhs.size == rhs.size &&
        lhs.fontName.name == rhs.fontName.name &&
        lhs.style == rhs.style &&
        lhs.isBold == rhs.isBold &&
        lhs.isHtml == rhs.isHtml &&
        lhs.isItalic == rhs.isHtml
    }
}

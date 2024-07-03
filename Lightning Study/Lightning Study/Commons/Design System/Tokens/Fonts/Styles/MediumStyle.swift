import UIKit

public struct MediumStyle: FontStyle {
    public let size: CGFloat
    public let style: UIFont.TextStyle
    public var fontName: FontConvertible { FontFamily.Roboto.medium }
    public var isBold: Bool
    public var isItalic: Bool
    public var isHtml: Bool

    init(size: CGFloat, style: UIFont.TextStyle, isBold: Bool = false, isItalic: Bool = false, isHtml: Bool = false) {
        self.size = size
        self.style = style
        self.isBold = isBold
        self.isItalic = isItalic
        self.isHtml = isHtml
    }
}

extension MediumStyle: Equatable {
    public static func ==(_ lhs: MediumStyle, _ rhs: MediumStyle) -> Bool {
        lhs.size == rhs.size &&
        lhs.fontName.name == rhs.fontName.name &&
        lhs.style == rhs.style &&
        lhs.isBold == rhs.isBold &&
        lhs.isHtml == rhs.isHtml &&
        lhs.isItalic == rhs.isHtml
    }
}

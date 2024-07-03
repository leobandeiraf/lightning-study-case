import UIKit

public protocol FontStyle: Equatable {
    var size: CGFloat { get }
    var style: UIFont.TextStyle { get }
    var fontName: FontConvertible { get }
    var isBold: Bool { get set }
    var isItalic: Bool { get set }
    var isHtml: Bool { get set }
}

import UIKit

extension UIView {
    func corner(radius: Radius) {
        layer.cornerRadius = radius.rawValue
        layer.masksToBounds = true
    }

    func roundCorners(corners: UIRectCorner, radius: Radius) {
        clipsToBounds = true
        layer.cornerRadius = radius.rawValue
        var masked = CACornerMask()
        if corners.contains(.topLeft) { masked.insert(.layerMinXMinYCorner) }
        if corners.contains(.topRight) { masked.insert(.layerMaxXMinYCorner) }
        if corners.contains(.bottomLeft) { masked.insert(.layerMinXMaxYCorner) }
        if corners.contains(.bottomRight) { masked.insert(.layerMaxXMaxYCorner) }
        self.layer.maskedCorners = masked
    }
}

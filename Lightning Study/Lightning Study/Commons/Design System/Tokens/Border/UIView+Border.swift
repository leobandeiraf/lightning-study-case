import UIKit

extension UIView {
    func border(size: Border, style: Border.Style, color: Color) {
        switch style {
        case .solid:
            borderSolid(size: size, color: color)
        default:
            borderDashed(size: size, color: color)
        }
    }

    func borderSolid(size: Border, color: Color) {
        layer.borderWidth = size.rawValue
        layer.borderColor = color.color.cgColor
    }

    func borderDashed(size: Border, color: Color) {
        self.layer.borderWidth = size.rawValue
        self.layer.borderColor = UIColor.clear.cgColor

        let shape = CAShapeLayer()
        shape.strokeColor = color.color.cgColor
        shape.lineDashPattern = [3, 3]
        shape.frame = self.bounds
        shape.fillColor = nil
        shape.path = UIBezierPath(rect: self.bounds).cgPath

        self.layer.addSublayer(shape)
    }
}

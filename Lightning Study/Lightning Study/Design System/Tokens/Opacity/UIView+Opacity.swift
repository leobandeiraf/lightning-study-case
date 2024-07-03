import UIKit

extension UIView {
    func opacity(_ opacity: Opacity) {
        layer.opacity = opacity.rawValue
    }
}

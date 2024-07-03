import UIKit

public extension UIStackView {
    func addArrangedSubview(_ view: any ViewRepresentable) {
        addArrangedSubview(view.makeView())
    }
    
    func addArrangedSubviews(_ views: any ViewRepresentable...) {
        views.forEach { addArrangedSubview($0) }
    }
}

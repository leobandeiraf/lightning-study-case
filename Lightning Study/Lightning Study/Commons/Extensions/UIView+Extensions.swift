import UIKit

extension UIView: ViewRepresentable {
    public var body: UIView { self }
    public func makeView() -> UIView { self }
}

extension UIView {
    func addSubview( _ view: any ViewRepresentable) {
        addSubview(view.body)
    }
    
    func addSubviews(_ views: any ViewRepresentable...) {
        views.forEach { addSubview($0) }
    }
    
    func dropShadow(
        color: Color = Color("#000000"),
        offset: CGSize = CGSize(width: 0.0, height: 4.0),
        opacity: Float = 0.06,
        radius: CGFloat = 12.0,
        shouldRasterize: Bool = true,
        scale: Bool = true
    ) {
        layer.masksToBounds = false
        layer.shadowColor = color.color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shouldRasterize = shouldRasterize
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

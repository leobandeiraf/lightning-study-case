import UIKit

public protocol ViewRepresentable {
    // MARK: - Associated Type(s).
    associatedtype ViewType: UIView

    // MARK: - Property(ies).
    var body: ViewType { get }

    // MARK: - Function(s).
    func makeView() -> ViewType
}

import Foundation

public protocol Configurable {
    associatedtype Model
    
    @discardableResult
    func configure(with model: Model) -> Self
}

import UIKit

enum Radius: RawRepresentable, Equatable, Hashable {
    // MARK: - Associated Type(s).
    typealias RawValue = CGFloat

    // MARK: - Case(s).
    /// Value: 0
    case none

    /// Value: 4
    case small

    /// Value: 8
    case medium

    /// Value: 12
    case large

    /// Value: 16
    case strong

    /// Value: 1000
    case full
    
    /// Custom value to Radius.
    case custom(CGFloat)

    // MARK: - Public Property(ies).
    var rawValue: CGFloat {
        switch self {
        case .small:
            return 4
        case .medium:
            return 8
        case .large:
            return 12
        case .strong:
            return 16
        case .full:
            return 1_000
        case .custom(let value):
            return value
        default:
            return 0
        }
    }

    // MARK: - Constructor(s).
    init?(rawValue: CGFloat) {
        switch rawValue {
        case 4:
            self = .small
        case 8:
            self = .medium
        case 12:
            self = .large
        case 16:
            self = .strong
        case 1_000:
            self = .full
        default:
            self = .none
        }
    }
}

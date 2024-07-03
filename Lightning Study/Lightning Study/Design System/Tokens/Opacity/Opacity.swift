import UIKit

/// Opacity represents transparency levels
enum Opacity: RawRepresentable, Equatable, Hashable {
    // MARK: - Associated Type(s).
    typealias RawValue = Float

    // MARK: - Case(s).
    /// Value: 0.0
    case none

    /// Value: 0.10
    case ultraLight

    /// Value: 0.25
    case light

    /// Value: 0.50
    case medium

    /// Value: 0.75
    case strong

    /// Value: 1.0
    case full

    // MARK: - Public Property(ies).
    var rawValue: RawValue {
        switch self {
        case .none:
            return 0
        case .ultraLight:
            return 0.1
        case .light:
            return 0.25
        case .medium:
            return 0.5
        case .strong:
            return 0.75
        case .full:
            return 1
        }
    }

    // MARK: - Constructor(s).
    init?(rawValue: RawValue) {
        switch rawValue {
        case 0:
            self = .none
        case 0.1:
            self = .ultraLight
        case 0.25:
            self = .light
        case 0.5:
            self = .medium
        case 0.75:
            self = .strong
        case 1:
            self = .full
        default:
            self = .full
        }
    }
}

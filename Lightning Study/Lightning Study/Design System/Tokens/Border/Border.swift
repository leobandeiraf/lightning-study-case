import UIKit

/// Border represents border levels
enum Border: RawRepresentable, Equatable, Hashable {
    /// None, default value 0.0
    case none

    /// Small, default value 1.0
    case small

    /// Medium, default value 4.0
    case medium

    /// Large, default value 8.0
    case large
    
    case custom(CGFloat)

    // MARK: - Public Property(ies).
    var rawValue: CGFloat {
        switch self {
        case .none:
            return 0.0
        case .small:
            return 1.0
        case .medium:
            return 4.0
        case .large:
            return 8.0
        case .custom(let value):
            return value
        }
    }

    // MARK: - Constructor(s).
    init?(rawValue: CGFloat) {
        switch rawValue {
        case 1.0:
            self = .small
        case 4.0:
            self = .medium
        case 8.0:
            self = .large
        case 0.0:
            self = .none
        default:
            self = .custom(rawValue)
        }
    }

    enum Style: Equatable, Hashable {
        case solid, dashed
    }
}

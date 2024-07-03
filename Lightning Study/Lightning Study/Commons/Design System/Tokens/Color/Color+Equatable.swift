import Foundation

extension Color.AnyStorage: Equatable {
    public static func == (_ lhs: Color.AnyStorage, _ rhs: Color.AnyStorage) -> Bool {
        switch (lhs, rhs) {
        case let (.single(lhsColor), .single(rhsColor)):
            return lhsColor == rhsColor
        case let (.dynamic(lightLhs, darkLhs), .dynamic(lightRhs, darkRhs)):
            return lightLhs == lightRhs && darkLhs == darkRhs
        default:
            return false
        }
    }
}

extension Color: Equatable {
    public static func == (_ lhs: Color, _ rhs: Color) -> Bool {
        lhs.storage == rhs.storage && lhs.hex == rhs.hex
    }
}

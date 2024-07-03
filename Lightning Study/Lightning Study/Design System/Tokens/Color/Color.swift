import UIKit

protocol UserInterfaceDetectorProtocol {
    func getInterfaceStyle() -> UIUserInterfaceStyle?
}

struct DefaultUserInterfaceDetector: UserInterfaceDetectorProtocol {
    init () {}
    
    func getInterfaceStyle() -> UIUserInterfaceStyle? {
        UIApplication.shared.keyWindow?.rootViewController?.traitCollection.userInterfaceStyle
    }
}

struct Color {
    // MARK: - Internal Structure(s).
    enum AnyStorage {
        case single(color: UIColor)
        case dynamic(light: UIColor, dark: UIColor)
    }
    
    // MARK: - Private Property(ies).
    var storage: AnyStorage
    let userInterfaceDetector: UserInterfaceDetectorProtocol
    
    // MARK: - Public Property(ies).
    var hex: String {
        switch storage {
        case .single(let color):
            return color.hex
        case .dynamic(let light, let dark):
            return userInterfaceDetector.getInterfaceStyle() == .dark ? dark.hex : light.hex
        }
    }
    
    var color: UIColor {
        switch storage {
        case .single(let color):
            return color
        case .dynamic(let light, let dark):
            if #available(iOS 13.0, *) {
                return UIColor { traitCollection -> UIColor in
                    switch traitCollection.userInterfaceStyle {
                    case .dark:
                        return dark
                    default:
                        return light
                    }
                }
            } else {
                return light
            }
        }
    }
    
    var reversed: Color {
        switch storage {
        case .single(let color):
            return .init(color.hex)
        case .dynamic(let light, let dark):
            return .init(dark.hex, light.hex)
        }
    }
    
    var rgb: String {
        switch storage {
        case .single(let color):
            let ciColor = CIColor(color: color)
            return "\(Int(ciColor.red * 255.0)), \(Int(ciColor.green * 255.0)), \(Int(ciColor.blue * 255.0))"
        case .dynamic(let light, let dark):
            let userInterfaceStyle = UIApplication.shared.keyWindow?.rootViewController?.traitCollection.userInterfaceStyle
            let ciColor = CIColor(color: userInterfaceStyle == .light ? light : dark)
            return "\(Int(ciColor.red * 255.0)), \(Int(ciColor.green * 255.0)), \(Int(ciColor.blue * 255.0))"
        }
    }
    
    // MARK: - Public Constructor(s).
    init(_ color: UIColor, detector: UserInterfaceDetectorProtocol = DefaultUserInterfaceDetector()) {
        self.storage = .single(color: color.hex.isEmpty ? .clear : color)
        self.userInterfaceDetector = detector
    }
    
    init(_ color: UIColor, opacity: Opacity = .full, detector: UserInterfaceDetectorProtocol = DefaultUserInterfaceDetector()) {
        self.storage = .single(color: color.hex.isEmpty ? .clear : color.withAlphaComponent(opacity))
        self.userInterfaceDetector = detector
    }
    
    init(_ hex: String, detector: UserInterfaceDetectorProtocol = DefaultUserInterfaceDetector()) {
        self.storage = .single(color: hex.isEmpty ? .clear : .init(hex: hex))
        self.userInterfaceDetector = detector
    }
    
    init(_ hex: String, opacity: Opacity = .full, detector: UserInterfaceDetectorProtocol = DefaultUserInterfaceDetector()) {
        self.storage = .single(color: hex.isEmpty ? .clear : .init(hex: hex).withAlphaComponent(opacity))
        self.userInterfaceDetector = detector
    }
    
    init(_ light: String, _ dark: String, opacity: Opacity = .full, detector: UserInterfaceDetectorProtocol = DefaultUserInterfaceDetector()) {
        self.storage = .dynamic(
            light: light.isEmpty ? .clear : .init(hex: light).withAlphaComponent(opacity),
            dark:  dark.isEmpty ? .clear : .init(hex: dark).withAlphaComponent(opacity)
        )
        self.userInterfaceDetector = detector
    }
    
    // MARK: - Public Function(s).
    @discardableResult
    func opacity(_ opacity: Opacity) -> Self {
        switch storage {
        case .single(let color):
            return Color(color.hex, opacity: opacity)
        case .dynamic(let light, let dark):
            return Color(light.hex, dark.hex, opacity: opacity)
        }
    }
}

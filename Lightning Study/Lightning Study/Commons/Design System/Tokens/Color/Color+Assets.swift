import UIKit

extension Color {
    /// Returns a color object whose values are:
    /// - Light Mode: `#262626`.
    static let black = Color(assets("black"))
    
    /// Returns a color object whose values are:
    /// - Alpha value is 0.0.
    static let clear = Color(.clear)
    
    /// Returns a color object whose values are:
    /// - Light Mode: `#FF4445`.
    /// /// - Dark Mode: `#F13A2F`.
    static let mainColor = Color(assets("mainColor"))
    
    /// Returns a color object whose values are:
    /// - Light Mode: `#4E4E4E`.
    static let neutralColor01 = Color(assets("neutralColor01"))
    
    /// Returns a color object whose values are:
    /// - Light Mode: `#464855`.
    static let neutralColor02 = Color(assets("neutralColor02"))
    
    /// Returns a color object whose values are:
    /// - Light Mode: `#666666`.
    static let neutralColor03 = Color(assets("neutralColor03"))
    
    /// Returns a color object whose values are:
    /// - Light Mode: `#C7C7C7`.
    static let neutralColor04 = Color(assets("neutralColor04"))
    
    /// Returns a color object whose values are:
    /// - Light Mode: `#9D9D9D`.
    static let neutralColor05 = Color(assets("neutralColor05"))
    
    /// Returns a color object whose values are:
    /// - Light Mode: `#FFFFFF`.
    /// - Dark Mode: `#000000`.
    static let white = Color(assets("white"))
    
    static func assets(_ colorNamed: String) -> UIColor {
        let bundle = BundleToken.bundle
        let color = UIColor(named: colorNamed, in: bundle, compatibleWith: nil)
        
        guard let color = color else {
            print("Unable to load image asset named \(colorNamed).")
            return UIColor()
        }
        
        return color
    }
}

import UIKit

// MARK: - Fonts
 enum FontFamily {
     enum Roboto {
         static let all: [FontConvertible] = [black, bold, boldItalic, italic, medium, regular]
         static let black = FontConvertible(name: "Roboto-Black", family: "Roboto", path: "Roboto-Black.ttf")
         static let bold = FontConvertible(name: "Roboto-Bold", family: "Roboto", path: "Roboto-Bold.ttf")
         static let boldItalic = FontConvertible(name: "Roboto-BoldItalic", family: "Roboto", path: "Roboto-BoldItalic.ttf")
         static let italic = FontConvertible(name: "Roboto-RegularItalic", family: "Roboto", path: "Roboto-RegularItalic.ttf")
         static let medium = FontConvertible(name: "Roboto-Medium", family: "Roboto", path: "Roboto-Medium.ttf")
         static let regular = FontConvertible(name: "Roboto-Regular", family: "Roboto", path: "Roboto-Regular.ttf")
    }
    
     static let allCustomFonts: [FontConvertible] = [Roboto.all].flatMap { $0 }
    
     static func registerAllCustomFonts() {
        allCustomFonts.forEach { $0.register() }
    }
}

// MARK: - Implementation Details
 struct FontConvertible {
     let name: String
     let family: String
     let path: String
     var url: URL? { BundleToken.bundle.url(forResource: path, withExtension: nil) }

     func font(size: CGFloat) -> UIFont {
        guard let font = UIFont(font: self, size: size) else {
            debugPrint("Unable to initialize font '\(name)' (\(family))")
            return UIFont.systemFont(ofSize: 16)
        }
        return font
    }

     func register() {
        guard let url = url else { return }
        CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
    }
}

 extension UIFont {
    convenience init?(font: FontConvertible, size: CGFloat) {
        if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
            font.register()
        }
        self.init(name: font.name, size: size)
    }
}

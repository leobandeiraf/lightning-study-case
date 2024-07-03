import UIKit

public extension UITextField {
    func font(_ fontStyle: any FontStyle) {
        if let font = UIFont(font: fontStyle.fontName, size: fontStyle.size) {
            let preferred = UIFontMetrics(forTextStyle: fontStyle.style)
            self.font = preferred.scaledFont(for: font)
        }
    }
}

public extension UINavigationBar {
    func largeTitleFont(_ fontStyle: any FontStyle) {
        if let font = UIFont(font: fontStyle.fontName, size: fontStyle.size) {
            let metrics = UIFontMetrics(forTextStyle: fontStyle.style)
            largeTitleTextAttributes = [.font: metrics.scaledFont(for: font)]
        }
    }

    func titleFont(_ fontStyle: any FontStyle) {
        if let font = UIFont(font: fontStyle.fontName, size: fontStyle.size) {
            let metrics = UIFontMetrics(forTextStyle: fontStyle.style)
            titleTextAttributes = [.font: metrics.scaledFont(for: font)]
        }
    }
}

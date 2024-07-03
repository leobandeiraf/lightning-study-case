import Foundation

final class BundleToken {
    static let bundle: Bundle = {
        guard let url = Bundle(for: BundleToken.self).url(forResource: "Lightning Study", withExtension: "bundle"),
              let bundle = Bundle(url: url) else {
            return Bundle(for: BundleToken.self)
        }
        return bundle
    }()
}

import Foundation

extension Int {
    var bitcoin: String {
        "\(self / Int(100000000)) BTC"
    }
}

import UIKit

public typealias TableViewCell = UITableViewCell & Configurable & ViewConfigurable
extension UITableViewCell: Reusable {}

public extension UITableViewCell {
    static func errorValue(with message: String) -> Self {
        assert(false, message)
        let cell = Self()
        cell.textLabel?.text = message
        return cell
    }
}

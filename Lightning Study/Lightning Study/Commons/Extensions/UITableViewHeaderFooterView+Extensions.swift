import UIKit

public typealias TableViewHeaderFooterView = UITableViewHeaderFooterView & Configurable & ViewConfigurable
extension UITableViewHeaderFooterView: Reusable {}

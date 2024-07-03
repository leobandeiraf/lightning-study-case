import UIKit

public extension UITableView {
    func updateRowsLayout(animated: Bool = false) {
        let block = {
            self.beginUpdates()
            self.endUpdates()
        }
        animated ? block() : UIView.performWithoutAnimation { block() }
    }
}

extension UITableView {
    func registerCell(reusable: Reusable.Type) {
        register(reusable, forCellReuseIdentifier: reusable.identifier)
    }
    
    func registerFooterHeader(reusable: Reusable.Type) {
        register(reusable, forHeaderFooterViewReuseIdentifier: reusable.identifier)
    }
    
    private func dequeueCell<T>(at indexPath: IndexPath) -> T? where T: UITableViewCell {
        dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T
    }
    
    func dequeueCell<T>(at indexPath: IndexPath) -> T where T: UITableViewCell {
        dequeueCell(at: indexPath) ?? .errorValue(with: "Unexpected ReusableCell Type for reuseID \(T.identifier)")
    }
    
    func dequeueView<T>() -> T where T: UITableViewHeaderFooterView {
        guard let cell = dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T else {
            fatalError("Unexpected ReusableView Type for reuseIdentifier \(T.identifier)")
        }
        return cell
    }
}

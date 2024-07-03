import UIKit

class TableViewRow<Cell>: CellProvider, Tappable where Cell: TableViewCell {
    // MARK: - Property(ies).
    private var model: Cell.Model
    private var tapClosure: (() -> Void)?
    
    // MARK: - Initialization.
    init(model: Cell.Model, tapClosure: (() -> Void)? = nil) {
        self.model = model
        self.tapClosure = tapClosure
    }
    
    // MARK: - Method(s).
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: Cell = tableView.dequeueCell(at: indexPath)
        return cell.configure(with: model)
    }
    
    func performTap() {
        tapClosure?()
    }
}

import UIKit

struct TableViewSection<Section: Hashable> {
    // MARK: - Property(ies).
    typealias Row = CellProvider & Tappable
    
    var numberOfRows: Int { rows.count }
    private(set) var id: Section
    private(set) var header: UITableViewHeaderFooterView?
    private(set) var rows: [Row]
    private(set) var footer: UITableViewHeaderFooterView?
    
    
    // MARK: - Initialization.
    init(id: Section, rows: [Row] = []) {
        self.id = id
        self.rows = rows
    }
}

extension TableViewSection {
    mutating func addHeader(_ header: UITableViewHeaderFooterView) {
        self.header = header
    }
    
    mutating func addFooter(_ footer: UITableViewHeaderFooterView) {
        self.footer = footer
    }
    
    mutating func addRows(_ rows: [Row]) {
        self.rows.append(contentsOf: rows)
    }
    
    mutating func removeHeader() {
        self.header = nil
    }
        
    mutating func removeFooter() {
        self.footer = nil
    }
    
    mutating func removeRows() {
        self.rows.removeAll()
    }
}

extension TableViewSection {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        rows[indexPath.row].tableView(tableView, cellForRowAt: indexPath)
    }

    func tapOnRow(_ tableView: UITableView, at indexPath: IndexPath) {
        rows[indexPath.row].performTap()
    }
}

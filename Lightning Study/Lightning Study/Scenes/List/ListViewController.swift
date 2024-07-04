import SnapKit
import UIKit

protocol ListDisplaying: AnyObject {
    func displayLoading(_ value: Bool)
    func displayNodes(with nodes: [Node])
}

private extension ListViewController.Layout {
    enum Size {
        static let imageHeight: CGFloat = 90.0
    }
}

final class ListViewController: ViewController<ListViewModeling, ListCoordinating> {
    // MARK: - Property(ies).
    fileprivate enum Layout {}
    fileprivate enum Section: CaseIterable { case list }
    
    // MARK: - Component(s).
    private lazy var tableView = TableView<Section>()
        .register(cells: ListCell.self)
    
    // MARK: - Override(s).
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - ViewConfiguration.
    override func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    override func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
        
    override func configureViews() {
        title = "Nodes"
        view.background(color: .init(.white))
        viewModel?.getNodes()
    }
    
    // MARK: - Method(s).
    
    // MARK: - Update(s)
        
    // MARK: - Setup(s).
    
}

// MARK: - ListDisplaying
extension ListViewController: ListDisplaying {
    func displayLoading(_ value: Bool) {
        
    }
    
    func displayNodes(with nodes: [Node]) {
        tableView.add(rows: nodes.map { TableViewRow<ListCell>(model: $0) }, in: .list)
    }
}

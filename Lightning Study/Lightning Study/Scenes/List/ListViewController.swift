import SnapKit
import UIKit

protocol ListDisplaying: AnyObject {
    func displayError()
    func displayLoading(_ isLoading: Bool)
    func displayNodes(with nodes: [Node])
}

private extension ListViewController.Layout {}

final class ListViewController: ViewController<ListViewModeling, ListCoordinating> {
    // MARK: - Property(ies).
    fileprivate enum Layout {}
    fileprivate enum Section: CaseIterable { case list }
    
    // MARK: - Component(s).
    private lazy var tableView = TableView<Section>()
        .register(cells: ListCell.self)
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(performRefresh), for: .valueChanged)
        refreshControl.tintColor = Color.mainColor.color
        return refreshControl
    }()
    
    private lazy var loadingView = LoadingViewController()
    
    private lazy var errorView = ErrorView()
    
    // MARK: - Override(s).
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - ViewConfiguration.
    override func buildViewHierarchy() {
        view.addSubview(tableView)
        tableView.addSubview(refreshControl)
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
    @objc
    private func performRefresh() {
        tableView.removeAllContent()
        viewModel?.getNodes()
        refreshControl.endRefreshing()
    }
}

// MARK: - ListDisplaying
extension ListViewController: ListDisplaying {
    func displayError() {
        tableView.backgroundView(errorView)
    }
    
    func displayLoading(_ isLoading: Bool) {
        isLoading ? loadingView.start(in: self) : loadingView.stop(in: self)
    }
    
    func displayNodes(with nodes: [Node]) {
        tableView.add(rows: nodes.map { TableViewRow<ListCell>(model: $0) }, in: .list)
    }
}

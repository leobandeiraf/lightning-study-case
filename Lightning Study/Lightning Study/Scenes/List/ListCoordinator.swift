import UIKit

protocol ListCoordinating {
    func start()
}

final class ListCoordinator {
    // MARK: - Property(ies).
    weak var navigationController: UINavigationController?
    weak var rootViewController: UIViewController?

    // MARK: - Initialization.
    init(_ navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
    }
}

// MARK: - ListCoordinating.
extension ListCoordinator: ListCoordinating {
    func start() {
        let service = ListService()
        let viewModel = ListViewModel(service: service)
        let viewController = ListViewController(viewModel: viewModel, coordinator: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        self.navigationController = navigationController
        viewController.coordinator = self
        rootViewController = viewController
    }
}

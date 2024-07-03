import UIKit

protocol ListCoordinating {
    func start()
}

final class ListCoordinator: Coordinator {
    // MARK: - Property(ies).
    weak var navigationController: UINavigationController?
    weak var rootViewController: UIViewController?
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()

    // MARK: - Initialization.
    init(_ navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
    }
}

// MARK: - ListCoordinating.
extension ListCoordinator: ListCoordinating {
    func start() {
        let service = ListService()
        let coordinator = ListCoordinator()
        let viewModel = ListViewModel(service: service)
        let viewController = ListViewController(viewModel: viewModel, coordinator: self)
        
        viewModel.display = viewController
        
        rootViewController = viewController
        navigationController?.pushViewController(viewController, animated: true)
    }
}

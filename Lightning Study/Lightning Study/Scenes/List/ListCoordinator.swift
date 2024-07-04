import UIKit

protocol ListCoordinating {
    func start()
    func goToLoading()
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
        
        viewController.coordinator = self
        viewModel.viewController = viewController
        
        self.navigationController = navigationController
        rootViewController = viewController
    }
    
    func goToLoading() {
        let viewController = LoadingViewController()
        viewController.modalPresentationStyle = .overCurrentContext
        navigationController?.present(viewController, animated: false)
    }
}

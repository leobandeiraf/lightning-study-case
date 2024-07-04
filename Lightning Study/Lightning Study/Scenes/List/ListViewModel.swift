import Foundation

protocol ListViewModeling: AnyObject {
    func getNodes()
}

final class ListViewModel {
    // MARK: - Property(ies).
    private let service: ListServicing
    weak var viewController: ListDisplaying?

    // MARK: - Initialization.
    init(service: ListServicing) {
        self.service = service
    }
}

// MARK: - ListViewModeling.
extension ListViewModel: ListViewModeling {
    func getNodes() {
        service.getTopNodes { [weak self] result in
            switch result {
            case .success(let model):
                self?.viewController?.displayNodes(with: model)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

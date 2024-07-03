import Foundation

protocol ListViewModeling: AnyObject {
    func doSomething()
}

final class ListViewModel {
    // MARK: - Property(ies).
    private let service: ListServicing
    weak var display: ListDisplaying?

    // MARK: - Initialization.
    init(service: ListServicing) {
        self.service = service
    }
}

// MARK: - ListViewModeling.
extension ListViewModel: ListViewModeling {
    func doSomething() {
        // template
    }
}

import Foundation

protocol ListServicing {
    func getSomething()
}

final class ListService {
    private var http: HTTPProtocol
    
    init(http: HTTPProtocol = HTTP()) {
        self.http = http
    }
}

// MARK: - ListServicing.
extension ListService: ListServicing {
    func getSomething() {
        // template
    }
}

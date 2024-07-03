import Foundation

protocol ListServicing {
    func getTopNodes(completion: @escaping (Result<[Node]?, HTTPError>) -> Void)
}

final class ListService {
    private var http: HTTPProtocol
    
    init(http: HTTPProtocol = HTTP()) {
        self.http = http
    }
}

// MARK: - ListServicing.
extension ListService: ListServicing {
    func getTopNodes(completion: @escaping (Result<[Node]?, HTTPError>) -> Void) {
        http.request(service: ListEndpoints.nodes, with: [Node].self) { result in
            DispatchQueue.main.async { completion(result) }
        }
    }
}

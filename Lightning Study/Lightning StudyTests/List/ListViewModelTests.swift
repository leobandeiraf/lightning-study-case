import XCTest

@testable import Lightning_Study

private class ListDisplayingSpy: ListDisplaying {
    enum Message: Equatable {
        case displayLoading(_ value: Bool)
        case displayNodes(with nodes: [Node])
    }

    private(set) var messages = [Message]()
   
    func displayLoading(_ value: Bool) {
        messages.append(.displayLoading(value))
    }
    
    func displayNodes(with nodes: [Node]) {
        messages.append(.displayNodes(with: nodes))
    }
}

private class ListServicingMock: ListServicing {
    var nodeExpectedResult: Result<[Node], HTTPError> = .failure(.noInternet)
    func getTopNodes(completion: @escaping (Result<[Node], HTTPError>) -> Void) {
        completion(nodeExpectedResult)
    }
}

// MARK: - Setup SUT

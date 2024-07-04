@testable import Lightning_Study
import XCTest

private class ListDisplayingSpy: ListDisplaying {
    enum Message: Equatable {
        case displayError
        case displayLoading(Bool)
        case displayNodes([Node])
    }

    private(set) var messages: [Message] = []
   
    func displayError() {
        messages.append(.displayError)
    }
    
    func displayLoading(_ isLoading: Bool) {
        messages.append(.displayLoading(isLoading))
    }
    
    func displayNodes(with nodes: [Node]) {
        messages.append(.displayNodes(nodes))
    }
}

private class ListServiceMock: ListServicing {
    var nodeExpectedResult: Result<[Node], HTTPError> = .failure(.noInternet)
    func getTopNodes(completion: @escaping (Result<[Node], HTTPError>) -> Void) {
        completion(nodeExpectedResult)
    }
}

// MARK: - Setup SUT
private extension ListViewModelTests {
    typealias DependencySUT = (
        sut: ListViewModel,
        displaySpy: ListDisplayingSpy,
        serviceMock: ListServiceMock
    )

    func makeSUT() -> DependencySUT {
        let displaySpy = ListDisplayingSpy()
        let serviceMock = ListServiceMock()

        let sut = ListViewModel(service: serviceMock)
        sut.viewController = displaySpy
        return (sut, displaySpy, serviceMock)
    }
}

// MARK: - Tests
final class ListViewModelTests: XCTestCase {
    func testGetNode_WhenSuccess_ShouldCallDisplayNodes() {
        let args = makeSUT()
        args.serviceMock.nodeExpectedResult = .success([.fixture()])
        
        args.sut.getNodes()

        XCTAssertEqual(args.displaySpy.messages, [.displayLoading(true), .displayLoading(false), .displayNodes([.fixture()])])
    }
    
    func testGetNode_WhenFailue_ShouldCallDisplayError() {
        let args = makeSUT()
        
        args.sut.getNodes()

        XCTAssertEqual(args.displaySpy.messages, [.displayLoading(true), .displayLoading(false), .displayError])
    }
}

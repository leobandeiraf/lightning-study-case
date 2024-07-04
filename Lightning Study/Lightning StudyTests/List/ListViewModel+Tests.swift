@testable import Lightning_Study
import XCTest

private class ListDisplayingSpy: ListDisplaying {
    enum Message: Equatable {
        case displayLoading(Bool)
        case displayNodes([Node])
    }

    private(set) var messages: [Message] = []
   
    func displayLoading(_ isLoading: Bool) {
        messages.append(.displayLoading(isLoading))
    }
    
    func displayNodes(with nodes: [Node]) {
        messages.append(.displayNodes(nodes))
    }
}

private class ListServiceMock: ListServicing {
    var nodeExpectedResult: Result<[Node], HTTPError> = .success([.fixture()])
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

        args.sut.getNodes()

        XCTAssertEqual(args.displaySpy.messages, [.displayLoading(true), .displayLoading(false), .displayNodes([.fixture()])])
    }
}

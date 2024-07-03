import Foundation

enum HeaderBuilder {
    case basic

    func build(_ customHeaders: [String: String]? = nil) -> [String: String] {
        switch self {
        case .basic:
            return basicHeader(with: customHeaders)
        }
    }

    private func basicHeader(with customHeaders: [String: String]? = nil) -> [String: String] {
        var headers: [String: String] = [:]
        headers["Content-Type"] = "application/json"
        return headers
    }
}

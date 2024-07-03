import Foundation

enum HTTPError: Error {
    case noData
    case invalidURL
    case noInternet
    case parseFailed
    case statusCode(_ statusCode: Int, _ object: Any)
    case unknown
    case manutention

    var localizedDescription: String {
        switch self {
        case .noData, .invalidURL, .unknown, .statusCode:
            return "Não conseguimos realizar a sua solicitação"
        case .manutention:
            return "Estamos em manutenção para melhor atende-lo."
        case .parseFailed:
            return "Erro ao montar sua solicitação"
        case .noInternet:
            return "Estamos tendo problemas com a conexão."
        }
    }
}

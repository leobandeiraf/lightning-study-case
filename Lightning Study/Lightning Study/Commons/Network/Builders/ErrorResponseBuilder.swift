import Foundation

struct ErrorResponseBuilder {
    static func build(from response: HTTPURLResponse, error: Error?, data: Data? = nil) throws {
        guard error == nil else {
            throw HTTPError.unknown
        }

        let statusCode = response.statusCode
        if 200...299 ~= statusCode && error == nil {
            return
        }
        
        if 500...504 ~= statusCode {
            throw HTTPError.manutention
        }

        let errorObject = try? HTTPDecodeBuilder.buildToDictionary(from: data)
        throw HTTPError.statusCode(statusCode, errorObject as Any)
    }
}

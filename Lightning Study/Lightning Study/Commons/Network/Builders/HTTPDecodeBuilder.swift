import Foundation

struct HTTPDecodeBuilder {
    static func build<Model: Decodable>(from data: Data?, objectType: Model.Type?) throws -> Model {
        guard let objectType = objectType else { throw HTTPError.unknown }
        guard let data = data else { throw HTTPError.noData }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .secondsSince1970
            let object = try decoder.decode(objectType, from: data)
            return object
        } catch {
            debugPrint("===> Decode ERROR: ", error.localizedDescription)
            throw HTTPError.parseFailed
        }
    }

    static func buildToDictionary(from data: Data?) throws -> [String: Any]? {
        guard let data = data else { throw HTTPError.noData }

        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject]
            return json
        } catch {
            debugPrint(error)
            throw HTTPError.parseFailed
        }
    }
}

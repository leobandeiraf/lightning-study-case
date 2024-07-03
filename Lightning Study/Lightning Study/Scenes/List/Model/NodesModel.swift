import Foundation

struct NodesModel: Decodable {
    let topByCapacity: [Node]
    let topByChannels: [Node]
    
    struct Node: Decodable {
        let publicKey: String
        let alias: String
        let capacity: Int?
        let channels: Int?
        let city: [Place]?
        let country: [Place]?
    }
    
    struct Place: Decodable {
        let de, en, es, fr: String?
        let ja, ptBR, ru: String?
        let zhCN: String?

        enum CodingKeys: String, CodingKey {
            case de, en, es, fr, ja
            case ptBR = "pt-BR"
            case ru
            case zhCN = "zh-CN"
        }
    }
}

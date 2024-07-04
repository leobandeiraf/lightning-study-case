import Foundation

struct Node: Decodable, Equatable {
    let publicKey, alias: String
    let channels, capacity: Int
    let firstSeen, updatedAt: Double
    let city, country: Place?
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.publicKey == rhs.publicKey
    }
}

struct Place: Decodable {
    let de, en, es, fr, ja, ptBR, ru, zhCN: String?

    enum CodingKeys: String, CodingKey {
        case de, en, es, fr, ja
        case ptBR = "pt-BR"
        case ru
        case zhCN = "zh-CN"
    }
}

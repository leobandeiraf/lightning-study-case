import Foundation

struct Node: Decodable {
    let publicKey, alias: String
    let channels, capacity: Int
    let firstSeen, updatedAt: Double
    let city: Place?
    let country: Place
}

struct Place: Decodable {
    let de, en, es, fr, ja, ptBR, ru, zhCN: String

    enum CodingKeys: String, CodingKey {
        case de, en, es, fr, ja
        case ptBR = "pt-BR"
        case ru
        case zhCN = "zh-CN"
    }
}

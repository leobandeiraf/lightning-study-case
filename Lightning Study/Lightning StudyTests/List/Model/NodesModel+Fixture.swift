@testable import Lightning_Study

extension Node {
    static func fixture(
        publicKey: String = String(),
        alias: String = String(),
        channels: Int = 0,
        capacity: Int = 0,
        firstSeen: Double = 0,
        updatedAt: Double = 0,
        city: Place? = nil,
        country: Place? = nil
    ) -> Node {
        Node(
            publicKey: publicKey,
            alias: alias,
            channels: channels,
            capacity: capacity,
            firstSeen: firstSeen,
            updatedAt: updatedAt,
            city: city,
            country: country
        )
    }
}

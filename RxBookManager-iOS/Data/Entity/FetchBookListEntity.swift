import Foundation

//==================================================
// MARK: - Entity
//==================================================
extension FetchBookListAPI {
    struct Response: Decodable {
        let status: Int
        let result: [Book]
    }
}

struct Book: Decodable {
    let id: Int
    let name: String
    let image: String?
    let price: Int?
    let purchaseDate: String?

    enum CodingKeys: String, CodingKey {
        case purchaseDate = "purchase_date"
        case id
        case name
        case image
        case price
    }
}

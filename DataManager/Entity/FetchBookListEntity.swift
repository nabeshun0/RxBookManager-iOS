
extension FetchBookListAPI {
    public struct Response: Decodable {
        var status: Int
        var result: [Book]
    }
}

public struct Book: Decodable {
    var id: Int
    var name: String
    var image: String?
    var price: Int?
    var purchaseDate: String?

    enum CodingKeys: String, CodingKey {
        case purchaseDate = "purchase_date"
        case id
        case name
        case image
        case price
    }
}

import Foundation

//==================================================
// MARK: - Entity
//==================================================
extension DetailBookAPI {
    struct Response: Decodable {
        var status: Int
        var result: Book
    }
}

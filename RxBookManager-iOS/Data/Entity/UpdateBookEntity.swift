import Foundation

//==================================================
// MARK: - Entity
//==================================================
extension UpdateBookAPI {
    struct Response: Decodable {
        var status: Int
        var result: Book
    }
}

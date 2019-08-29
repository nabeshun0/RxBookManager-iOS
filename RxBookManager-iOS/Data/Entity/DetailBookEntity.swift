import Foundation

//==================================================
// MARK: - Entity
//==================================================
extension DetailBookAPI {
    struct Response: Decodable {
        let status: Int
        let result: Book
    }
}

import Foundation

//==================================================
// MARK: - Entity
//==================================================
extension RegisterBookAPI {
    struct Response: Decodable {
        let status: Int
        let result: Book
    }
}

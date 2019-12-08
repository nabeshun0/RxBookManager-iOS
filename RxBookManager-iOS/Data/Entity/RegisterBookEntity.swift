import Foundation

//==================================================
// MARK: - Entity
//==================================================
extension RegisterBookAPI {
    struct Response: Decodable {
        var status: Int
        var result: Book
    }
}

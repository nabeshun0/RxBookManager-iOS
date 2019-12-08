import Foundation

//==================================================
// MARK: - Entity
//==================================================
extension LoginAPI {
    struct Response: Decodable {
        var status: Int
        var result: User

        struct User: Decodable {
            var id: Int
            var email: String
            var token: String
        }
    }
}

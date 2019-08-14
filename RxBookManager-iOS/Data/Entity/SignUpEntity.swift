import Foundation

//==================================================
// MARK: - Entity
//==================================================
extension SignUpAPI {
    struct Response: Decodable {
        let status: Int
        let result: User

        struct User: Decodable {
            let id: Int
            let email: String
            let token: String
        }
    }
}

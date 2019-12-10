
extension LoginAPI {
    public struct Response: Decodable {
        var status: Int
        var result: User

        public struct User: Decodable {
            var id: Int
            var email: String
            var token: String
        }
    }
}


extension SignUpAPI {
    public struct Response: Decodable {
        public var status: Int
        public var result: User
    }
}

public struct User: Decodable {
    public var id: Int
    public var email: String
    public var token: String
}

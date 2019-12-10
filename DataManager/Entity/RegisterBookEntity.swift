
extension RegisterBookAPI {
    public struct Response: Decodable {
        var status: Int
        var result: Book
    }
}

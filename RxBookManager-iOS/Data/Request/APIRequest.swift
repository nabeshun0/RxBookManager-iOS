import Foundation
import APIKit

protocol APIRequest: Request {
}
// ここが共通の処理
extension APIRequest where Response: Decodable {
    var dataParser: DataParser {
        return DecodableDataParser()
    }

    // レスポンスをデコード
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        return try JSONDecoder().decode(Response.self, from: data)
    }
}

extension APIRequest {
    var baseURL: URL {
        // 定数クラスで保管
        return URL(string: Constants.Api.baseURL)!
    }
}


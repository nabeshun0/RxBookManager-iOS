import APIKit

//==================================================
// MARK: - APIError
//==================================================
enum APPErrorCode: Int, Error {
    case error400 = 400
    case error401 = 401
    case error403 = 403
    case error404 = 404
    case error500 = 500
}

//==================================================
// MARK: - DecodableDataParser
//==================================================
// ヘッダー情報など共通の処理
final class DecodableDataParser: DataParser {
    var contentType: String? {
        return "application/json"
    }

    func parse(data: Data) throws -> Any {
        return data
    }
}

//==================================================
// MARK: - AppRequestType
//==================================================
public protocol AppRequestType: Request {}

extension AppRequestType {
    // BaseURL
    var baseURL: URL {
        return URL(string: Constants.Api.baseURL)!
    }

    // HeaderFields
    var headerFields: [String: String] {
        return ["Content-Type": "application/json",
                "charset": "utf-8"]
    }
    // InterCept
    public func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {

        switch urlResponse.statusCode {
        case 200..<300:
            return object
        case 400:
            throw APPErrorCode.error400
        case 401:
            throw APPErrorCode.error401
        case 403:
            throw APPErrorCode.error403
        case 404:
            throw APPErrorCode.error404
        case 500:
            throw APPErrorCode.error500
        default:
            throw ResponseError.unacceptableStatusCode(urlResponse.statusCode)
        }
    }

    public func intercept(urlRequest: URLRequest) throws -> URLRequest {
        var req = urlRequest
        req.timeoutInterval = 5.0
        return req
    }
}

extension AppRequestType where Response: Decodable {
    var dataParser: DataParser {
        return DecodableDataParser()
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        return try JSONDecoder().decode(Response.self, from: data)
    }
}

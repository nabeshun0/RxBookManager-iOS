import Foundation
import APIKit

//==================================================
// MARK: - API
//==================================================
final class LogoutAPI {
    struct Request: AppRequestType {
        typealias Response = LogoutAPI.Response

        var headerFields: [String: String] {
            return ["Authorization": CommmonUserDefaults.getToken()]
        }

        var method: HTTPMethod {
            return APIRoutes.logout.configurePath().method
        }

        var path: String {
            return APIRoutes.logout.configurePath().path
        }
    }
}

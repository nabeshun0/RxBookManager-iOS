import Foundation
import APIKit

//==================================================
// MARK: - API
//==================================================
final class LogoutAPI {
    struct Request: AppRequestType {
        typealias Response = LogoutAPI.Response

        var headerFields: [String: String] {
            #warning("✅【実装予定】UserDefalutsに保存したtokenを取得する")
            guard let accessToken = Optional("token") else {
                return [:] }
            return ["Authorization": accessToken]
        }

        var method: HTTPMethod {
            return APIRoutes.logout.configurePath().method
        }

        var path: String {
            return APIRoutes.logout.configurePath().path
        }
    }
}

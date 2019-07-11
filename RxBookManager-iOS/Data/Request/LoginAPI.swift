import Foundation
import APIKit

//==================================================
// MARK: - API
//==================================================
final class LoginAPI {
    struct Request: AppRequestType {
        typealias Response = LoginAPI.Response

        // パラメータモデル
        var loginModel: LoginModel

        var headerFields: [String: String] {
            return [:]
        }

        var method: HTTPMethod {
            return APIRoutes.login.configurePath().method
        }

        var path: String {
            return APIRoutes.login.configurePath().path
        }

        var parameters: Any? {
            var data = [String: Any]()
            data["email"] = loginModel.email
            data["password"] = loginModel.password
            return data
        }
    }
}



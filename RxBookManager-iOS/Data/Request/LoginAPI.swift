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

        var apiRoutes = APIRoutes.login.configurePath()

        var method: HTTPMethod {
            return apiRoutes.method
        }

        var path: String {
            return apiRoutes.path
        }

        var parameters: Any? {
            var data = [String: Any]()
            data["email"] = loginModel.email
            data["password"] = loginModel.password
            return data
        }
    }
}



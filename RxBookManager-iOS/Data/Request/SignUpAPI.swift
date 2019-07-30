import Foundation
import APIKit

//==================================================
// MARK: - API
//==================================================
final class SignUpAPI {
    struct Request: AppRequestType {
        typealias Response = SignUpAPI.Response

        // パラメータモデル
        var signUpModel: SignUpModel

        var headerFields: [String: String] {
            return [:]
        }

        var method: HTTPMethod {
            return APIRoutes.signUp.configurePath().method
        }

        var path: String {
            return APIRoutes.signUp.configurePath().path
        }

        var parameters: Any? {
            var data = [String: Any]()
            data["email"] = signUpModel.email
            data["password"] = signUpModel.password
            return data
        }
    }
}

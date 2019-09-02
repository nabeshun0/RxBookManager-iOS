
import Foundation
import APIKit

//==================================================
// MARK: - API
//==================================================
final class RegisterBookAPI {
    struct Request: AppRequestType {
        typealias Response = RegisterBookAPI.Response

        // パラメータモデル
        var registerBookModel: RegisterBookModel

        var headerFields: [String: String] {
            return ["Authorization": CommmonUserDefaults.getToken()]
        }

        var method: HTTPMethod {
            return APIRoutes.registerBook.configurePath().method
        }

        var path: String {
            return APIRoutes.registerBook.configurePath().path
        }

        var parameters: Any? {
            var data = [String: Any]()
            data["name"] = registerBookModel.name
            data["image"] = registerBookModel.image
            data["price"] = registerBookModel.price
            data["purchase_date"] = registerBookModel.purchaseDate
            return data
        }
    }
}


import Foundation
import APIKit

//==================================================
// MARK: - API
//==================================================
final class DetailBookAPI {
    struct Request: AppRequestType {
        typealias Response = DetailBookAPI.Response

        // パラメータモデル
        var info: BookModel

        var headerFields: [String: String] {
            return ["Authorization": LocalDataStore.getToken()]
        }

        var method: HTTPMethod {
            return APIRoutes.detailBook.configurePath().method
        }

        var path: String {
            return APIRoutes.detailBook.configurePath().path + "/\(info.id)"
        }

        var parameters: Any? {
            var data = [String: Any]()
            data["name"] = info.name
            data["image"] = info.image
            data["price"] = info.price
            data["purchase_date"] = info.purchaseDate
            return data
        }
    }
}

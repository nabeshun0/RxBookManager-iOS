
import Foundation
import APIKit

//==================================================
// MARK: - API
//==================================================
final class DetailBookAPI {
    struct Request: AppRequestType {
        typealias Response = DetailBookAPI.Response

        // パラメータモデル
        var detailBookModel: DetailBookModel

        var headerFields: [String: String] {
            return ["Authorization": CommmonUserDefaults.getToken()]
        }

        var method: HTTPMethod {
            return APIRoutes.detailBook.configurePath().method
        }

        var path: String {
            return APIRoutes.detailBook.configurePath().path + "/\(detailBookModel.id)"
        }

        var parameters: Any? {
            var data = [String: Any]()
            data["name"] = detailBookModel.name
            data["image"] = detailBookModel.image
            data["price"] = detailBookModel.price
            data["purchase_date"] = detailBookModel.purchaseDate
            return data
        }
    }
}

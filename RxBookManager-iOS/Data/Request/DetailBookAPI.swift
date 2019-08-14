
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
            #warning("✅【実装予定】UserDefalutsに保存したtokenを取得する")
            guard let accessToken = Optional("") else {
                return [:] }
            return ["Authorization": accessToken]
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

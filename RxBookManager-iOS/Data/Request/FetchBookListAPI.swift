import Foundation
import APIKit

//==================================================
// MARK: - API
//==================================================
final class FetchBookListAPI {
    struct Request: AppRequestType {
        typealias Response = FetchBookListAPI.Response

        // パラメータモデル
        var fetchBookListModel: FetchBookListModel

        var headerFields: [String: String] {
            #warning("✅【実装予定】UserDefalutsに保存したtokenを取得する")
            guard let accessToken = Optional("") else {
                return [:] }
            return ["Authorization": accessToken]
        }

        var method: HTTPMethod {
            return APIRoutes.fetchBookList.configurePath().method
        }

        var path: String {
            return APIRoutes.fetchBookList.configurePath().path
        }

        var parameters: Any? {
            var data = [String: Any]()
            data["limit"] = fetchBookListModel.limit
            data["page"] = fetchBookListModel.page
            return data
        }
    }
}

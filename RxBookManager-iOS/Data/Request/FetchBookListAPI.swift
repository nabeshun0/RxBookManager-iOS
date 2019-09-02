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
            return ["Authorization": CommmonUserDefaults.getToken()]
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

import APIKit

public class LogoutAPI {
    struct Request: AppRequestType {
        typealias Response = LogoutAPI.Response

        var headerFields: [String: String] {
            return ["Authorization": LocalDataStore.getToken()]
        }

        var method: HTTPMethod {
            return APIRoutes.logout.configurePath().method
        }

        var path: String {
            return APIRoutes.logout.configurePath().path
        }
    }
}

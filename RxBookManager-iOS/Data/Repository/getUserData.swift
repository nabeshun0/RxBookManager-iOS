import APIKit
import Result
import RxSwift

//==================================================
// MARK: - ログイン、リクエスト・レスポンス
//==================================================
protocol GetLoginDataStore {
    func getLoginResponse(login: LoginModel) -> Single<LoginAPI.Response>
}

struct GetLoginDataStoreImpl: GetLoginDataStore {
    func getLoginResponse(login: LoginModel) -> Single<LoginAPI.Response> {
        let request = LoginAPI.Request(loginModel: login)
        return Session.rx_sendRequest(request: request)
    }
}

//==================================================
// MARK: - 新規登録、リクエスト・レスポンス
//==================================================


//==================================================
// MARK: - ログアウト、リクエスト・レスポンス
//==================================================

protocol GetLogoutDataStore {
    func getLogoutResponse() -> Single<LogoutAPI.Response>
}

struct GetLogoutDataStoreImpl: GetLogoutDataStore {
    func getLogoutResponse() -> Single<LogoutAPI.Response> {
        let request = LogoutAPI.Request()
        return Session.rx_sendRequest(request: request)
    }
}

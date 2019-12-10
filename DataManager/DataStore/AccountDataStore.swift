import APIKit
import RxSwift

public protocol AccountDataStore {
    func login(with info: AuthModel) -> Observable<LoginAPI.Response>
    func signUp(with info: AuthModel) -> Observable<SignUpAPI.Response>
    func logout() -> Observable<LogoutAPI.Response>
}

public struct AccountDataStoreImpl: AccountDataStore {

    //==================================================
    // MARK: - ログイン、リクエスト・レスポンス
    //==================================================

    public func login(with info: AuthModel) -> Observable<LoginAPI.Response> {
        let request = LoginAPI.Request(info: info)
        return Session.rx_sendRequest(request: request)
    }

    //==================================================
    // MARK: - 新規登録、リクエスト・レスポンス
    //==================================================

    public func signUp(with info: AuthModel) -> Observable<SignUpAPI.Response> {
        let request = SignUpAPI.Request(info: info)
        return Session.rx_sendRequest(request: request)
    }

    //==================================================
    // MARK: - ログアウト、リクエスト・レスポンス
    //==================================================

    public func logout() -> Observable<LogoutAPI.Response> {
        let request = LogoutAPI.Request()
        return Session.rx_sendRequest(request: request)
    }
}

struct AccountDataStoreFactory {
    static func createUserAccountDataStore() -> AccountDataStore {
        return AccountDataStoreImpl()
    }
}

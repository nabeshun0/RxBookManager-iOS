import APIKit
import RxSwift

public protocol AccountDataStore {
    func SignIn(with info: AuthModel) -> Observable<SignInAPI.Response>
    func signUp(with info: AuthModel) -> Observable<SignUpAPI.Response>
    func SignOut() -> Observable<SignOutAPI.Response>
}

public struct AccountDataStoreImpl: AccountDataStore {

    //==================================================
    // MARK: - ログイン、リクエスト・レスポンス
    //==================================================

    public func SignIn(with info: AuthModel) -> Observable<SignInAPI.Response> {
        let request = SignInAPI.Request(info: info)
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

    public func SignOut() -> Observable<SignOutAPI.Response> {
        let request = SignOutAPI.Request()
        return Session.rx_sendRequest(request: request)
    }
}

struct AccountDataStoreFactory {
    static func createUserAccountDataStore() -> AccountDataStore {
        return AccountDataStoreImpl()
    }
}

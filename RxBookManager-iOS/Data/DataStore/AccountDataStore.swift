import APIKit
import RxSwift

protocol AccountDataStore {
    func login(login: LoginModel) -> Single<LoginAPI.Response>
    func signUp(signUp: SignUpModel) -> Single<SignUpAPI.Response>
    func logout() -> Single<LogoutAPI.Response>
}

struct AccountDataStoreImpl: AccountDataStore {

    //==================================================
    // MARK: - ログイン、リクエスト・レスポンス
    //==================================================

    func login(login: LoginModel) -> Single<LoginAPI.Response> {
        let request = LoginAPI.Request(loginModel: login)
        return Session.rx_sendRequest(request: request)
    }

    //==================================================
    // MARK: - 新規登録、リクエスト・レスポンス
    //==================================================

    func signUp(signUp: SignUpModel) -> Single<SignUpAPI.Response> {
        let request = SignUpAPI.Request(signUpModel: signUp)
        return Session.rx_sendRequest(request: request)
    }

    //==================================================
    // MARK: - ログアウト、リクエスト・レスポンス
    //==================================================

    func logout() -> Single<LogoutAPI.Response> {
        let request = LogoutAPI.Request()
        return Session.rx_sendRequest(request: request)
    }
}

struct AccountDataStoreFactory {
    static func createUserAccountDataStore() -> AccountDataStore {
        return AccountDataStoreImpl()
    }
}

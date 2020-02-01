
import APIKit
import RxSwift

public protocol AccountRepository {
    func SignIn(_ params: AuthModel) -> Observable<SignInAPI.Response>
    func signup(_ params: AuthModel) -> Observable<SignUpAPI.Response>
    func SignOut() -> Observable<SignOutAPI.Response>
}

public class AccountRepositoryImpl: AccountRepository {

    public let dataStore = AccountDataStoreFactory.createUserAccountDataStore()

    public init() {}
    
    public func SignIn(_ params: AuthModel) -> Observable<SignInAPI.Response> {
        return dataStore.SignIn(with: params)
        .do(onNext: { result in
            let token = result.result.token
            LocalDataStore.saveToken(value: token)
        })
    }

    public func signup(_ params: AuthModel) -> Observable<SignUpAPI.Response> {
        return dataStore.signUp(with: params)
            .do(onNext: { result in
                let token = result.result.token
                LocalDataStore.saveToken(value: token)
        })
    }

    public func SignOut() -> Observable<SignOutAPI.Response> {
        return dataStore.SignOut()
            .do(onNext: { result in
                // tokenを削除
                LocalDataStore.clearToken()
            })
    }
}

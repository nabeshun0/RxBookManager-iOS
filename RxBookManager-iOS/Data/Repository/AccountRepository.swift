//
//  UserRepository.swift
//  RxBookManager-iOS
//
//  Created by Iichiro Kawashima on 2019/08/28.
//  Copyright © 2019 nabezawa. All rights reserved.
//

import APIKit
import RxSwift

protocol AccountRepository {
    func login(_ params: LoginModel) -> Single<LoginAPI.Response>
    func signup(_ params: SignUpModel) -> Single<SignUpAPI.Response>
    func logout() -> Single<LogoutAPI.Response>
}

final class AcoountRepositoryImpl: AccountRepository {
    static let shared = AcoountRepositoryImpl()

    private let dataStore = AccountDataStoreFactory.createUserAccountDataStore()

    func login(_ params: LoginModel) -> Single<LoginAPI.Response> {
        return dataStore.login(login: params)
            .do(onSuccess: { result in
                // TODO: - userdefaultに保存
                print(result.result.token)
            })
    }

    func signup(_ params: SignUpModel) -> Single<SignUpAPI.Response> {
        return dataStore.signUp(signUp: params)
            .do(onSuccess: { result in
                // TODO: - userdefaultに保存
                print(result.result.token)
            })
    }

    func logout() -> Single<LogoutAPI.Response> {
        return dataStore.logout()
            .do(onSuccess: { result in
                // TODO: - userdefaltのToken削除
            })
    }
}

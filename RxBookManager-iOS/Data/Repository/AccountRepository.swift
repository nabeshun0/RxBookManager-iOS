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
    func login(_ params: AuthModel) -> Observable<LoginAPI.Response>
    func signup(_ params: AuthModel) -> Observable<SignUpAPI.Response>
    func logout() -> Observable<LogoutAPI.Response>
}

final class AccountRepositoryImpl: AccountRepository {
    static let shared = AccountRepositoryImpl()

    private let dataStore = AccountDataStoreFactory.createUserAccountDataStore()

    func login(_ params: AuthModel) -> Observable<LoginAPI.Response> {
        return dataStore.login(with: params)
        .do(onNext: { result in
            let token = result.result.token
            LocalDataStore.saveToken(value: token)
        })
    }

    func signup(_ params: AuthModel) -> Observable<SignUpAPI.Response> {
        return dataStore.signUp(with: params)
            .do(onNext: { result in
                let token = result.result.token
                LocalDataStore.saveToken(value: token)
        })
    }

    func logout() -> Observable<LogoutAPI.Response> {
        return dataStore.logout()
            .do(onNext: { result in
                // tokenを削除
                LocalDataStore.clearToken()
            })
    }
}

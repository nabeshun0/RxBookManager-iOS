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
    func login(_ params: LoginModel) -> Observable<LoginAPI.Response>
    func signup(_ params: SignUpModel) -> Observable<SignUpAPI.Response>
    func logout() -> Observable<LogoutAPI.Response>
}

final class AccountRepositoryImpl: AccountRepository {
    static let shared = AccountRepositoryImpl()

    private let dataStore = AccountDataStoreFactory.createUserAccountDataStore()

    func login(_ params: LoginModel) -> Observable<LoginAPI.Response> {
        return dataStore.login(login: params)
    }

    func signup(_ params: SignUpModel) -> Observable<SignUpAPI.Response> {
        return dataStore.signUp(signUp: params)
    }

    func logout() -> Observable<LogoutAPI.Response> {
        return dataStore.logout()
    }
}

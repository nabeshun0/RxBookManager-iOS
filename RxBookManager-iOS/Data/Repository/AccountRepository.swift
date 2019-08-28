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
    func login()
    func signup()
    func logout()
}

final class AcoountRepositoryImpl: AccountRepository {
    static let shared = AcoountRepositoryImpl()

    private let dataStore = AccountDataStoreFactory.createUserAccountDataStore()

    func login() {
        
    }

    func signup() {

    }

    func logout() {

    }
}

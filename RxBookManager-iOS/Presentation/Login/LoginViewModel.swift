//
//  LoginViewModel.swift
//  RxBookManager-iOS
//
//  Created by member on 2019/06/29.
//  Copyright © 2019 nabezawa. All rights reserved.
//

import RxSwift
import APIKit

final class LoginViewModel {

    private let disposeBag = DisposeBag()

    private let dependency: AccountRepository

    init(dependency: AccountRepository) {
        self.dependency = dependency
    }
}

extension LoginViewModel {

    struct Input {
        let didLoginButtonTapped: Observable<Void>
        let didSignupButtonTapped: Observable<Void>
        let emailText: Observable<String>
        let passwordText: Observable<String>
    }

    struct OutPut {

    }
}

//
//  SignUpViewModel.swift
//  RxBookManager-iOS
//
//  Created by member on 2019/06/29.
//  Copyright © 2019 nabezawa. All rights reserved.
//

import RxSwift
import APIKit

final class SignUpViewModel {

    private let disposeBag = DisposeBag()

    private let dependency: AccountRepository

    init(dependency: AccountRepository) {
        self.dependency = dependency
    }
}

extension SignUpViewModel {

    struct Input {
        let didSaveButtonTapped: Observable<Void>
        let emailText: Observable<String>
        let passwordText: Observable<String>
        let confirmText: Observable<String>
    }

    struct OutPut {

    }
}

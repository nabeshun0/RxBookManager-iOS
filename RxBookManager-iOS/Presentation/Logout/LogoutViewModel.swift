//
//  LogoutViewModel.swift
//  RxBookManager-iOS
//
//  Created by member on 2019/06/29.
//  Copyright © 2019 nabezawa. All rights reserved.
//

import Foundation
import RxSwift
import APIKit

final class LogoutViewModel {

    private let disposeBag = DisposeBag()

    private let dependency: AccountRepository

    init(dependency: AccountRepository) {
        self.dependency = dependency
    }
}

extension LogoutViewModel {

    struct Input {
        let didLogoutButtonTapped: Observable<Void>
    }

    struct OutPut {
        let error: Observable<Error>
    }
}

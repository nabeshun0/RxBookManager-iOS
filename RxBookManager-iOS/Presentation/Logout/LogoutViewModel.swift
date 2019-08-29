//
//  LogoutViewModel.swift
//  RxBookManager-iOS
//
//  Created by member on 2019/06/29.
//  Copyright © 2019 nabezawa. All rights reserved.
//
import RxCocoa
import RxSwift
import APIKit

final class LogoutViewModel {

    private let disposeBag = DisposeBag()

    private let dependency: AccountRepository

    init(dependency: AccountRepository) {
        self.dependency = dependency
    }
}

extension LogoutViewModel: ViewModelType {

    struct Input {
        let didButtonTapped: Observable<Void>
    }

    struct Output {
        let result: Observable<LogoutAPI.Response>
        let error: Observable<Error>
    }

    func transform(input: Input) -> Output {

        let response = input.didButtonTapped
            .flatMap { _ -> Observable<LogoutAPI.Response> in
                return self.dependency.logout()
            }.materialize().share(replay: 1)

        return Output(result: response.elements(), error: response.errors())
    }
}

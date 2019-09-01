import RxSwift
import APIKit

final class LoginViewModel {

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
        let result: Observable<LoginAPI.Response>
        let error: Observable<Error>
        let isValid: Observable<Bool>
    }

    func transform(input: Input) -> OutPut {

        let emailTextRelay = input.emailText
            .filter { $0.count >= 6 }
            .map { !$0.isEmpty }

        let passwordRelay = input.passwordText
            .filter { $0.count >= 6 }
            .map { !$0.isEmpty }

        let isValid = Observable.combineLatest(emailTextRelay, passwordRelay) { $0 && $1 }
        let parameter = Observable.combineLatest(input.emailText, input.passwordText)

        let response = input.didLoginButtonTapped
            .withLatestFrom(parameter)
            .flatMap { param -> Observable<LoginAPI.Response> in
                let loginModel = LoginModel(email: param.0, password: param.1)
                return self.dependency.login(loginModel)
        }.materialize().share(replay: 1)

        return OutPut(result: response.elements(), error: response.errors(), isValid: isValid)
    }
}

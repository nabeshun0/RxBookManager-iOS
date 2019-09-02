import RxSwift
import APIKit

final class SignUpViewModel {

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
        let result: Observable<SignUpAPI.Response>
        let error: Observable<Error>
        let isValid: Observable<Bool>
    }

    func transform(input: Input) -> OutPut {
        let emailTextRelay = input.emailText.map {
            $0.count >= 6
        }

        let passwordTextRelay = input.passwordText.map {
            $0.count >= 6
        }

        let confirmTextRelay = input.confirmText.map {
            $0.count >= 6
        }

        let isValid = Observable.combineLatest(emailTextRelay, passwordTextRelay, confirmTextRelay) { $0 && $1 && $2 }

        let parameter = Observable.combineLatest(input.emailText, input.passwordText)

        let response = input.didSaveButtonTapped
            .withLatestFrom(parameter)
            .flatMap { param -> Observable<Event<SignUpAPI.Response>> in
                let signUpModel = SignUpModel(email: param.0, password: param.1)
                return self.dependency.signup(signUpModel)
                .materialize()
        }.share(replay: 1)

        return OutPut(result: response.elements(), error: response.errors(), isValid: isValid)
    }
}

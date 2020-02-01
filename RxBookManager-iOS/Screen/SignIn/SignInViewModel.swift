import RxSwift
import DataManager

final class SignInViewModel {

    private let dependency: AccountRepository

    init(dependency: AccountRepository) {
        self.dependency = dependency
    }
}

extension SignInViewModel {

    struct Input {
        let didSignInButtonTapped: Observable<Void>
        let didSignupButtonTapped: Observable<Void>
        let emailText: Observable<String>
        let passwordText: Observable<String>
    }

    struct OutPut {
        let result: Observable<SignInAPI.Response>
        let error: Observable<Error>
        let isValid: Observable<Bool>
    }

    func transform(input: Input) -> OutPut {

        let emailTextRelay = input.emailText.map {
            $0.count >= 6
        }

        let passwordRelay = input.passwordText.map {
            $0.count >= 6
        }

        let isValid = Observable.combineLatest(emailTextRelay, passwordRelay) { $0 && $1 }
        let parameter = Observable.combineLatest(input.emailText, input.passwordText)

        let response = input.didSignInButtonTapped
            .withLatestFrom(parameter)
            .flatMap { param -> Observable<Event<SignInAPI.Response>> in
                let info = AuthModel(email: param.0, password: param.1)
                return self.dependency.SignIn(info)
                .materialize()
        }
        .share(replay: 1)

        return OutPut(result: response.elements(), error: response.errors(), isValid: isValid)
    }
}

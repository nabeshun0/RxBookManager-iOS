import APIKit
import RxSwift

extension Session {
    func rx_sendRequest<T: Request>(request: T) -> Single<T.Response> {
        return Single.create { observer in
            let task = self.send(request) { result in
                switch result {
                case .success(let res):
                    observer(.success(res))
                case .failure(let err):
                    observer(.error(err))
                }
            }
            return Disposables.create { [weak task] in
                task?.cancel()
            }
        }
    }

    class func rx_sendRequest<T: Request>(request: T) -> Single<T.Response> {
        return shared.rx_sendRequest(request: request)
    }
}


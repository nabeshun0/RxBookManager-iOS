import APIKit
import RxSwift
import Result

extension Session {
    func rx_sendRequest<T: Request>(request: T) -> Single<Result<T.Response, SessionTaskError>> {
        return Single.create { observer in
            let task = self.send(request) { result in
                observer(.success(result))
            }
            return Disposables.create {
                task?.cancel()
            }
        }
    }

    class func rx_sendRequest<T: Request>(request: T) -> Single<Result<T.Response, SessionTaskError>> {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        return Session.init(adapter: URLSessionAdapter(configuration: config)).rx_sendRequest(request: request)
    }
}

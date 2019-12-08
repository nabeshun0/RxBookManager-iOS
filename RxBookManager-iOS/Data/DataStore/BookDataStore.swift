import APIKit
import RxSwift

protocol BookDataStore {
    func fetchBook(with info: BookListModel) -> Observable<FetchBookListAPI.Response>
    func registerBook(with info: BookModel) -> Observable<RegisterBookAPI.Response>
    func updateBook(with info: BookModel) -> Observable<UpdateBookAPI.Response>
}

struct BookDataStoreImpl: BookDataStore {

    //==================================================
    // MARK: - 書籍一覧、リクエスト・レスポンス
    //==================================================

    func fetchBook(with info: BookListModel) -> Observable<FetchBookListAPI.Response> {
        let request = FetchBookListAPI.Request(info: info)
        return Session.rx_sendRequest(request: request)
    }

    //==================================================
    // MARK: - 書籍追加、リクエスト・レスポンス
    //==================================================

    func registerBook(with info: BookModel) -> Observable<RegisterBookAPI.Response> {
        let request = RegisterBookAPI.Request(info: info)
        return Session.rx_sendRequest(request: request)
    }

    //==================================================
    // MARK: - 書籍編集、リクエスト・レスポンス
    //==================================================

    func updateBook(with info: BookModel) -> Observable<UpdateBookAPI.Response> {
        let request = UpdateBookAPI.Request(info: info)
        return Session.rx_sendRequest(request: request)
    }
}

struct BookDataStoreFactory {
    static func createBookDataStore() -> BookDataStore {
        return BookDataStoreImpl()
    }
}

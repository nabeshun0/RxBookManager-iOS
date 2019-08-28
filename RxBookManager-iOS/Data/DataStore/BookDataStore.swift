import APIKit
import Result
import RxSwift

protocol BookDataStore {
    func fetchBook(fetchBookList: FetchBookListModel) -> Single<FetchBookListAPI.Response>
    func registerBook(registerBook: RegisterBookModel) -> Single<RegisterBookAPI.Response>
    func updateBook(detailBook: DetailBookModel) -> Single<DetailBookAPI.Response>
}

struct BookDataStoreImpl: BookDataStore {

    //==================================================
    // MARK: - 書籍一覧、リクエスト・レスポンス
    //==================================================

    func fetchBook(fetchBookList: FetchBookListModel) -> Single<FetchBookListAPI.Response> {
        let request = FetchBookListAPI.Request(fetchBookListModel: fetchBookList)
        return Session.rx_sendRequest(request: request)
    }

    //==================================================
    // MARK: - 書籍追加、リクエスト・レスポンス
    //==================================================

    func registerBook(registerBook: RegisterBookModel) -> Single<RegisterBookAPI.Response> {
        let request = RegisterBookAPI.Request(registerBookModel: registerBook)
        return Session.rx_sendRequest(request: request)
    }

    //==================================================
    // MARK: - 書籍編集、リクエスト・レスポンス
    //==================================================

    func updateBook(detailBook: DetailBookModel) -> Single<DetailBookAPI.Response> {
        let request = DetailBookAPI.Request(detailBookModel: detailBook)
        return Session.rx_sendRequest(request: request)
    }
}

struct BookDataStoreFactory {
    static func createBookDataStore() -> BookDataStore {
        return BookDataStoreImpl()
    }
}

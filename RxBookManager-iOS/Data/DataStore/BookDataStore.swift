import APIKit
import RxSwift

protocol BookDataStore {
    func fetchBook(fetchBookList: FetchBookListModel) -> Observable<FetchBookListAPI.Response>
    func registerBook(registerBook: RegisterBookModel) -> Observable<RegisterBookAPI.Response>
    func updateBook(detailBook: DetailBookModel) -> Observable<DetailBookAPI.Response>
}

struct BookDataStoreImpl: BookDataStore {

    //==================================================
    // MARK: - 書籍一覧、リクエスト・レスポンス
    //==================================================

    func fetchBook(fetchBookList: FetchBookListModel) -> Observable<FetchBookListAPI.Response> {
        let request = FetchBookListAPI.Request(fetchBookListModel: fetchBookList)
        return Session.rx_sendRequest(request: request)
    }

    //==================================================
    // MARK: - 書籍追加、リクエスト・レスポンス
    //==================================================

    func registerBook(registerBook: RegisterBookModel) -> Observable<RegisterBookAPI.Response> {
        let request = RegisterBookAPI.Request(registerBookModel: registerBook)
        return Session.rx_sendRequest(request: request)
    }

    //==================================================
    // MARK: - 書籍編集、リクエスト・レスポンス
    //==================================================

    func updateBook(detailBook: DetailBookModel) -> Observable<DetailBookAPI.Response> {
        let request = DetailBookAPI.Request(detailBookModel: detailBook)
        return Session.rx_sendRequest(request: request)
    }
}

struct BookDataStoreFactory {
    static func createBookDataStore() -> BookDataStore {
        return BookDataStoreImpl()
    }
}

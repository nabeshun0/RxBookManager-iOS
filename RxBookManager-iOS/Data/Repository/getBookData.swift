import APIKit
import Result
import RxSwift

//==================================================
// MARK: - 書籍一覧、リクエスト・レスポンス
//==================================================

protocol FetchBookListDataStore {
    func fetchBookListResponse(fetchBookList: FetchBookListModel) -> Single<FetchBookListAPI.Response>
}

struct FetchBookListDataStoreImpl: FetchBookListDataStore {
    func fetchBookListResponse(fetchBookList: FetchBookListModel) -> Single<FetchBookListAPI.Response> {
        let request = FetchBookListAPI.Request(fetchBookListModel: fetchBookList)
        return Session.rx_sendRequest(request: request)
    }
}

//==================================================
// MARK: - 書籍追加、リクエスト・レスポンス
//==================================================

protocol RegisterBookDataStore {
    func registerBookResponse(registerBook: RegisterBookModel) -> Single<RegisterBookAPI.Response>
}

struct RegisterBookDataStoreImpl: RegisterBookDataStore {
    func registerBookResponse(registerBook: RegisterBookModel) -> Single<RegisterBookAPI.Response> {
        let request = RegisterBookAPI.Request(registerBookModel: registerBook)
        return Session.rx_sendRequest(request: request)
    }
}

//==================================================
// MARK: - 書籍編集、リクエスト・レスポンス
//==================================================

protocol DetailBookDataStore {
    func detailBookResponse(detailBook: DetailBookModel) -> Single<DetailBookAPI.Response>
}

struct DetailBookDataStoreImpl: DetailBookDataStore {
    func detailBookResponse(detailBook: DetailBookModel) -> Single<DetailBookAPI.Response> {
        let request = DetailBookAPI.Request(detailBookModel: detailBook)
        return Session.rx_sendRequest(request: request)
    }
}

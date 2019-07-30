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


//==================================================
// MARK: - 書籍編集、リクエスト・レスポンス
//==================================================


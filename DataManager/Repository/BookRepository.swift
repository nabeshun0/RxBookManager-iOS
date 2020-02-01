
import RxSwift
import APIKit

public protocol BookRepository {
    func fetch(_ params: BookListModel) -> Observable<FetchBookListAPI.Response>
    func register(_ params: BookModel) -> Observable<RegisterBookAPI.Response>
    func update(_ params: BookModel) -> Observable<UpdateBookAPI.Response>
}

public class BookRepositoryImpl: BookRepository {
    
    public let dataStore = BookDataStoreFactory.createBookDataStore()

    public init() {}
    public func fetch(_ params: BookListModel) -> Observable<FetchBookListAPI.Response> {
        return dataStore.fetch(with: params)
    }

    public func register(_ params: BookModel) -> Observable<RegisterBookAPI.Response> {
        return dataStore.register(with: params)
    }

    public func update(_ params: BookModel) -> Observable<UpdateBookAPI.Response> {
        return dataStore.update(with: params)
    }
}

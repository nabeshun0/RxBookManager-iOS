import RxSwift
import DataManager

final class BookListViewModel {

    private let dependency: BookRepository
    lazy var books: [BookInfo] = []
    private var pageCount = 1

    init(dependency: BookRepository) {
        self.dependency = dependency
    }
}

extension BookListViewModel: ViewModelType {

    struct Input {
        let didReloadButtonTapped: Observable<Void>
        let viewWillAppear: Observable<[Any]>
    }

    struct Output {
        let result: Observable<FetchBookListAPI.Response>
        let error: Observable<Error>
        let firstResult: Observable<FetchBookListAPI.Response>
        let firstError: Observable<Error>
    }

    func transform(input: Input) -> Output {

        let firstResponse = input.viewWillAppear
            .flatMap { [weak self] _ -> Observable<Event<FetchBookListAPI.Response>> in
                guard let self = self else {
                    return Observable.empty()
                }
                let model = BookListModel(limit: 5, page: self.pageCount)
                self.pageCount += 1
                return self.dependency.fetchBook(model)
                    .materialize()
            }.share(replay: 1)

        let response = input.didReloadButtonTapped
            .flatMap { [weak self] _ -> Observable<Event<FetchBookListAPI.Response>> in
                guard let self = self else { return Observable.empty() }
                let model = BookListModel(limit: 5, page: self.pageCount)
                self.pageCount += 1
                return self.dependency.fetchBook(model)
                .materialize()
            }.share(replay: 1)

        return Output(result: response.elements(), error: response.errors(), firstResult: firstResponse.elements(), firstError: firstResponse.errors())
    }
}

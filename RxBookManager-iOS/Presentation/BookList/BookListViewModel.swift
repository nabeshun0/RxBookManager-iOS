import RxSwift
import APIKit

final class BookListViewModel {

    private let dependency: BookRepository

    init(dependency: BookRepository) {
        self.dependency = dependency
    }
}

extension BookListViewModel {

    struct Input {
        
    }

    struct Output {

    }
}

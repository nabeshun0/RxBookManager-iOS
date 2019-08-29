import APIKit
import RxSwift
import XCTest

@testable import RxBookManager_iOS

class BookDataStoreTests: XCTestCase {

    private let dataStore = BookDataStoreImpl()

    private let disposebag = DisposeBag()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFetch() {
        let fetchBookList = FetchBookListModel(limit: 5, page: 1)
        let exp = expectation(description: "fetchBookListRequest")

        dataStore.fetchBook(fetchBookList: fetchBookList)
        .subscribe(onNext: { response in
            print(response)
            exp.fulfill()
        }, onError: { error in
            print(error)
            XCTAssert(false)
        }).disposed(by: disposebag)

        wait(for: [exp], timeout: 5.0)
    }

    func testRegister() {
        let register = RegisterBookModel(name: "花火", image: "image", price: 400, purchaseDate: "2019-07-31")
        let exp = expectation(description: "registerBookRequest")

        dataStore.registerBook(registerBook: register)
        .subscribe(onNext: { response in
            print(response)
            exp.fulfill()
        }, onError: { error in
            print(error)
            XCTAssert(false)
        }).disposed(by: disposebag)

        wait(for: [exp], timeout: 5.0)
    }

    func testUpdate() {
        let detailBook = DetailBookModel(name: "花火祭り", image: "image", price: 2000, purchaseDate: "2019-08-04", id: 1508)
        let exp = expectation(description: "detailBookRequest")

        dataStore.updateBook(detailBook: detailBook)
        .subscribe(onNext: { response in
            print(response)
            exp.fulfill()
        }, onError: { error in
            print(error)
            XCTAssert(false)
        }).disposed(by: disposebag)

        wait(for: [exp], timeout: 5.0)
    }
}

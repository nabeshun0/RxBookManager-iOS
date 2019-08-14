import APIKit
import Result
import RxSwift
import XCTest

@testable import RxBookManager_iOS

class fetchBookListDataStoreTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFetchBookListDataStore() {
        let dataStore = FetchBookListDataStoreImpl()
        let fetchBookList = FetchBookListModel(limit: 5, page: 1)
        let disposebag = DisposeBag()
        let exp = expectation(description: "fetchBookListRequest")

        dataStore.fetchBookListResponse(fetchBookList: fetchBookList).subscribe(onSuccess: { response in
            print(response)
            exp.fulfill()
        }, onError: { error in
            print(error)
            XCTAssert(false)
        }).disposed(by: disposebag)

        wait(for: [exp], timeout: 5.0)
    }
}

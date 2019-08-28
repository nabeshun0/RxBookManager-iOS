import APIKit
import RxSwift
import XCTest

@testable import RxBookManager_iOS

class detailBookDataStoreTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testDetailBookDataStore() {
        let dataStore = DetailBookDataStoreImpl()
        let detailBook = DetailBookModel(name: "花火祭り", image: "image", price: 2000, purchaseDate: "2019-08-04", id: 1508)
        let disposebag = DisposeBag()
        let exp = expectation(description: "detailBookRequest")

        dataStore.detailBookResponse(detailBook: detailBook).subscribe(onSuccess: { response in
            print(response)
            exp.fulfill()
        }, onError: { error in
            print(error)
            XCTAssert(false)
        }).disposed(by: disposebag)

        wait(for: [exp], timeout: 5.0)
    }
}

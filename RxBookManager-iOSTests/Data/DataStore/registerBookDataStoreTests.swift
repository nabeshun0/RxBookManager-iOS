import APIKit
import Result
import RxSwift
import XCTest

@testable import RxBookManager_iOS

class registerBookDataStoreTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetLoginDataStore() {
        let dataStore = RegisterBookDataStoreImpl()
        let register = RegisterBookModel(name: "花火", image: "image", price: 400, purchaseDate: "2019-07-31")
        let disposebag = DisposeBag()
        let exp = expectation(description: "registerBookRequest")

        dataStore.registerBookResponse(registerBook: register).subscribe(onSuccess: { response in
            print(response)
            exp.fulfill()
        }, onError: { error in
            print(error)
            XCTAssert(false)
        }).disposed(by: disposebag)

        wait(for: [exp], timeout: 5.0)
    }
}

import APIKit
import RxSwift
import XCTest

@testable import RxBookManager_iOS

class getLogoutDataStoreTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetLogoutDataStore() {
        let dataStore = GetLogoutDataStoreImpl()
        let disposebag = DisposeBag()
        let exp = expectation(description: "logoutRequest")

        dataStore.getLogoutResponse()
            .subscribe(onSuccess: { response in
                print(response)
                exp.fulfill()
            }, onError: { error in
                print(error)
                XCTAssert(false)
            }).disposed(by: disposebag)
        wait(for: [exp], timeout: 5.0)
    }
}

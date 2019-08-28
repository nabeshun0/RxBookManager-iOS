import APIKit
import RxSwift
import XCTest

@testable import RxBookManager_iOS

class getLoginDataStoreTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetLoginDataStore() {
        let dataStore = GetLoginDataStoreImpl()
        let login = LoginModel(email: "", password: "")
        let disposebag = DisposeBag()
        let exp = expectation(description: "loginRequest")

        dataStore.getLoginResponse(login: login)
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

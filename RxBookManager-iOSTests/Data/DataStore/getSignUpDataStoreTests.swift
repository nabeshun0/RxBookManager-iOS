import APIKit
import RxSwift
import XCTest

@testable import RxBookManager_iOS

class getSignUpDataStoreTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetSignUpDataStore() {
        let dataStore = GetSignUpDataStoreImpl()
        let signUp = SignUpModel(email: "", password: "")
        let disposebag = DisposeBag()
        let exp = expectation(description: "signUpRequest")

        dataStore.getSignUpResponse(signUp: signUp)
            .subscribe(onSuccess: { response in
            print(response)
            exp.fulfill()
        }, onError: { error in
            print("error: \(error)")
            XCTAssert(false)
        }).disposed(by: disposebag)

        wait(for: [exp], timeout: 5.0)
    }
}

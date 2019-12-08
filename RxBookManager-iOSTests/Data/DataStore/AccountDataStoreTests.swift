import APIKit
import RxSwift
import XCTest

@testable import RxBookManager_iOS

class AccountDataStoreTests: XCTestCase {

    let disposebag = DisposeBag()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testLogin() {
        let dataStore = AccountDataStoreImpl()
        let model = AuthModel(email: "", password: "")
        let exp = expectation(description: "loginRequest")

        dataStore.login(with: model)
            .subscribe(onNext: { response in
                print(response)
                exp.fulfill()
            }, onError: { error in
                print(error)
                XCTAssert(false)
            }).disposed(by: disposebag)

        wait(for: [exp], timeout: 5.0)
    }

    func testSignup() {
        let dataStore = AccountDataStoreImpl()
        let model = AuthModel(email: "", password: "")
        let exp = expectation(description: "signupRequest")

        dataStore.signUp(with: model)
            .subscribe(onNext: { response in
                print(response)
                exp.fulfill()
            }, onError: { error in
                print(error)
                XCTAssert(false)
            }).disposed(by: disposebag)

        wait(for: [exp], timeout: 5.0)
    }

    func testLogout() {
        let dataStore = AccountDataStoreImpl()
        let exp = expectation(description: "signupRequest")

        dataStore.logout()
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

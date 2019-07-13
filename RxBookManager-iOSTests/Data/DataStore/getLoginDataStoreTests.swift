import APIKit
import Result
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


        dataStore.getLoginResponse(login: login)
            .subscribe(onSuccess: { response in
                print(response)

            }, onError: { error in
                print(error)
            }).disposed(by: disposebag)
    }




}

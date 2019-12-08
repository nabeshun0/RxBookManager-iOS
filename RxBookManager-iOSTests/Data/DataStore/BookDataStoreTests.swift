import APIKit
import RxSwift
import XCTest
import RxTest
import RxBlocking

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
        let model = BookListModel(limit: 5, page: 1)
        let exp = expectation(description: "fetchBookListRequest")

        dataStore.fetchBook(with: model)
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
        let model = BookModel(name: "花火", image: "image", price: 400, purchaseDate: "2019-07-31")
        let exp = expectation(description: "registerBookRequest")

        dataStore.registerBook(with: model)
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
        let model = BookModel(name: "花火祭り", image: "image", price: 2000, purchaseDate: "2019-08-04", id: 1508)
        let exp = expectation(description: "detailBookRequest")

        dataStore.updateBook(with: model)
        .subscribe(onNext: { response in
            print(response)
            exp.fulfill()
        }, onError: { error in
            print(error)
            XCTAssert(false)
        }).disposed(by: disposebag)

        wait(for: [exp], timeout: 5.0)
    }

    let scheduler = TestScheduler(initialClock: 1)

    func testViewModel() {
        let emailObservable = [
            Recorded.next(1, "i.kawashima41@gmail.com")
        ]

        let passwordObservable = [
            Recorded.next(1, "0401Tiro")
        ]



        do {
            let email = scheduler.createHotObservable(emailObservable)
            let password = scheduler.createHotObservable(passwordObservable)
            let viewModel = LoginViewModel(dependency: AccountRepositoryImpl())
            let input = LoginViewModel.Input(didLoginButtonTapped: Observable.of(), didSignupButtonTapped: Observable.of(), emailText: email.asObservable(), passwordText: password.asObservable())
            let output = viewModel.transform(input: input)
            output.result
                .subscribe(onNext: { result in
                    print(result)
                }).disposed(by: disposebag)

            scheduler.start()
        }
    }
}

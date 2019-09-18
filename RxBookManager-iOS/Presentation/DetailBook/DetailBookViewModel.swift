import RxSwift
import APIKit
import UIKit

final class DetailBookViewModel {
    private let dependency: BookRepository

    init(dependency: BookRepository) {
        self.dependency = dependency
    }
}

extension DetailBookViewModel {

    struct Input {
        let didSaveButtonTapped: Observable<Void>
        let bookNameText: Observable<String>
        let priceText: Observable<String>
        let purchaseDateText: Observable<String>
        let selectedImage: Observable<UIImage>
    }

    struct Output {
        let result: Observable<DetailBookAPI.Response>
        let error: Observable<Error>
        let isValid: Observable<Bool>
    }

    func transform(input: Input) -> Output {

        let bookNameTextRelay = input.bookNameText.map { !$0.isEmpty }

        let priceTextRelay = input.priceText
            .filter{ !$0.isEmpty }
            .compactMap { Int($0) }

        let priceTextBoolRelay = input.priceText.map { !$0.isEmpty }

        let purchaseDateTextReray = input.purchaseDateText.map { !$0.isEmpty }

        let selectedImageRelay = input.selectedImage.map {
            UIImage.convertImageToString(image: $0)
        }

        let isValid = Observable.combineLatest(bookNameTextRelay, priceTextBoolRelay, purchaseDateTextReray) {
            $0 && $1 && $2
        }

        let parameter = Observable.combineLatest(
        input.bookNameText,
        priceTextRelay,
        input.purchaseDateText,
        selectedImageRelay) {
        (name: $0, price: $1, purchaseDate: $2, imageStr: $3)}

        let hogeId = 1

        let response = input.didSaveButtonTapped
            .withLatestFrom(parameter)
            .flatMap { param -> Observable<Event<DetailBookAPI.Response>> in
                let detailBookModel = DetailBookModel(name: param.name, image: param.imageStr, price: param.price, purchaseDate: param.purchaseDate, id: hogeId)
                return self.dependency.updateBook(detailBookModel)
                .materialize()
        }.share(replay: 1)

        return Output(result: response.elements(), error: response.errors(), isValid: isValid)
    }
}

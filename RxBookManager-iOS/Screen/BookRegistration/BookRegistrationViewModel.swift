import RxSwift
import DataManager
import UIKit

final class BookRegistrationViewModel {

    private let dependency: BookRepository

    init(dependency: BookRepository) {
        self.dependency = dependency
    }
}

extension BookRegistrationViewModel: ViewModelType {

    struct Input {
        let didSaveButtonTapped: Observable<Void>
        let bookNameText: Observable<String>
        let priceText: Observable<String>
        let purchaseDateText: Observable<String>
        let selectedImage: Observable<UIImage>
    }

    struct Output {
        let result: Observable<RegisterBookAPI.Response>
        let error: Observable<Error>
        let isValid: Observable<Bool>
    }

    func transform(input: Input) -> Output {

        let bookNameTextRelay = input.bookNameText.map { !$0.isEmpty }

        let priceTextRelay = input.priceText
            .filter{ !$0.isEmpty }
            .compactMap { Int($0) }

        let priceTextBoolRelay = input.priceText
            .filter { !$0.isEmpty }
            .map { priceStr -> Bool in
            guard let _ = Int(priceStr) else {
                return false
            }
            return true
        }

        let purchaseDateTextReray = input.purchaseDateText.map { !$0.isEmpty }

        let selectedImageRelay = input.selectedImage
            .map { UIImage.convertImageToString(image: $0) }

        let isValid = Observable.combineLatest(bookNameTextRelay, priceTextBoolRelay, purchaseDateTextReray) {
            $0 && $1 && $2
        }

        let parameter = Observable.combineLatest(
            input.bookNameText,
            priceTextRelay,
            input.purchaseDateText,
            selectedImageRelay
        ){ (name: $0,
            price: $1,
            purchaseDate: $2,
            imageStr: $3
        )}

        let response = input.didSaveButtonTapped
            .withLatestFrom(parameter)
            .flatMap { param -> Observable<Event<RegisterBookAPI.Response>> in
                let info = BookModel(name: param.name, image: param.imageStr, price: param.price, purchaseDate: param.purchaseDate)
                return self.dependency.register(info)
                .materialize()
        }.share(replay: 1)

        return Output(result: response.elements(), error: response.errors(), isValid: isValid)
    }
}

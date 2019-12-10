import UIKit
import DataManager

protocol BookListRouting: RoutingType {
    func showRegisterBookVC()
    func showDetailBookVC(book: BookInfo)
}

final class BookListRoutingImpl: BookListRouting {

    var viewController: UIViewController?

    func showRegisterBookVC() {
        let vc = Factory.makeRegisterBookViewController()
        viewController?.present(vc, animated: true)
    }

    func showDetailBookVC(book: BookInfo) {
        let vc = Factory.makeDetailBookViewController(book: book)
        guard let view = viewController?.navigationController else { return }
        view.pushViewController(vc, animated: true)
    }
}


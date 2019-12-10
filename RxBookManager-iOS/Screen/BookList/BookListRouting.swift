import UIKit
import DataManager

protocol BookListRouting: RoutingType {
    func showRegisterBookVC()
    func showDetailBookVC(book: BookInfo)
}

final class BookListRoutingImpl: BookListRouting {

    var viewController: UIViewController?

    func showRegisterBookVC() {
        let vc = RegisterBookViewControllerFactory.makeInstance()
        viewController?.present(vc, animated: true)
    }

    func showDetailBookVC(book: BookInfo) {
        let vc = DetailBookViewControllerFactory.makeInstance(book: book)
        guard let view = viewController?.navigationController else { return }
        view.pushViewController(vc, animated: true)
    }
}

private extension BookListRoutingImpl {
    struct RegisterBookViewControllerFactory {
        static func makeInstance() -> UINavigationController {
            let dependency = BookRepositoryImpl()
            let viewModel = RegisterBookViewModel(dependency: dependency)
            let vc = RegisterBookViewController(viewModel: viewModel)
            return UINavigationController(rootViewController: vc)
        }
    }

    struct DetailBookViewControllerFactory {
        static func makeInstance(book: BookInfo) -> DetailBookViewController {
            let dependency = BookRepositoryImpl()
            let viewModel = DetailBookViewModel(dependency: dependency)
            return DetailBookViewController(viewModel: viewModel, book: book)
        }
    }
}

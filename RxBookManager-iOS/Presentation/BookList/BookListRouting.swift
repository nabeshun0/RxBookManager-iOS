import UIKit

protocol BookListRouting: RoutingType {
    func showRegisterBookVC()
    func showDetailBookVC(book: Book)
}

final class BookListRoutingImpl: BookListRouting {

    var viewController: UIViewController?

    func showRegisterBookVC() {
        let vc = RegisterBookViewControllerFactory.createInstance()
        viewController?.present(vc, animated: true)
    }

    func showDetailBookVC(book: Book) {
        let vc = DetailBookViewControllerFactory.createInstance(book: book)
        guard let view = viewController?.navigationController else { return }
        view.pushViewController(vc, animated: true)
    }
}

struct RegisterBookViewControllerFactory {
    static func createInstance() -> UINavigationController {
        let dependency = BookRepositoryImpl.shared
        let viewModel = RegisterBookViewModel(dependency: dependency)
        let vc = RegisterBookViewController(viewModel: viewModel)
        return UINavigationController(rootViewController: vc)
    }
}

struct DetailBookViewControllerFactory {
    static func createInstance(book: Book) -> DetailBookViewController {
        let dependency = BookRepositoryImpl.shared
        let viewModel = DetailBookViewModel(dependency: dependency)
        return DetailBookViewController(viewModel: viewModel, book: book)
    }
}

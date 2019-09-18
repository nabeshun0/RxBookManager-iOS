import UIKit

protocol BookListRouting: RoutingType {
    func showRegisterBookVC()
    func showDetailBookVC()
}

final class BookListRoutingImpl: BookListRouting {

    var viewController: UIViewController?

    var navigationController: UINavigationController?

    func showRegisterBookVC() {
        let vc = RegisterBookViewControllerFactory.createInstance()
        viewController?.present(vc, animated: true)
    }

    func showDetailBookVC() {
        let vc = DetailBookViewControllerFactory.createInstance()
        navigationController?.pushViewController(vc, animated: true)
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
    static func createInstance() -> DetailBookViewController {
        let dependency = BookRepositoryImpl.shared
        let viewModel = DetailBookViewModel(dependency: dependency)
        return DetailBookViewController(viewModel: viewModel)
    }
}

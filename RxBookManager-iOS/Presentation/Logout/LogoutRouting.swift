import UIKit
import Foundation

protocol LogoutRouting: RoutingType {
    func showLogin()
}

final class LogoutRoutingImpl: LogoutRouting {

    weak var viewController: UIViewController?

    func showLogin() {
        let vc = LoginViewControllerFactory.makeInstance()
        viewController?.present(vc, animated: true)
    }
}

struct LoginViewControllerFactory {
    static func makeInstance() -> UINavigationController {
        let dependency = AccountRepositoryImpl()
        let viewModel = LoginViewModel(dependency: dependency)
        let vc = LoginViewController(viewModel: viewModel)
        return UINavigationController(rootViewController: vc)
    }
}

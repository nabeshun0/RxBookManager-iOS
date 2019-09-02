import UIKit
import Foundation

protocol LogoutRouting: RoutingType {
    func showLogin()
}

final class LogoutRoutingImpl: LogoutRouting {

    weak var viewController: UIViewController?

    func showLogin() {
        let vc = LoginViewControllerFactory.createInstance()
        viewController?.present(vc, animated: true)
    }
}

struct LoginViewControllerFactory {
    static func createInstance() -> UINavigationController {
        let dependency = AccountRepositoryImpl.shared
        let viewModel = LoginViewModel(dependency: dependency)
        let vc = LoginViewController(viewModel: viewModel)
        return UINavigationController(rootViewController: vc)
    }
}

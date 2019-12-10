import UIKit
import DataManager

protocol SplashRouting: RoutingType {
    func showLogin()
    func showWalkthrough()
}

final class SplashRoutingImpl: SplashRouting {

    weak var viewController: UIViewController?

    func showLogin() {
        let dependency = AccountRepositoryImpl()
        let viewModel = LoginViewModel(dependency: dependency)
        let vc = LoginViewController(viewModel: viewModel)
        let nc = UINavigationController(rootViewController: vc)
        viewController?.present(nc, animated: true)
    }

    func showWalkthrough() {
        let vc = WalkthroughViewController()
        viewController?.present(vc, animated: true)
    }
}

import UIKit

protocol SplashRouting: RoutingType {
    func showLogin()
}

final class SplashRoutingImpl: SplashRouting {

    weak var viewController: UIViewController?

    func showLogin() {
        let dependency = AccountRepositoryImpl.shared
        let viewModel = LoginViewModel(dependency: dependency)
        let vc = LoginViewController(viewModel: viewModel)
        let nc = UINavigationController(rootViewController: vc)
        viewController?.present(nc, animated: true)
    }
}

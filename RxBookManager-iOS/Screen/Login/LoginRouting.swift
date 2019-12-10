import UIKit

protocol LoginRouting: RoutingType {
    func showMainTab()
    func showSignUp()
}

final class LoginRoutingImpl: LoginRouting {

    weak var viewController: UIViewController?

    func showMainTab() {
        let mainTabVC = MainTabBarController()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        appDelegate.window?.rootViewController = mainTabVC
    }

    func showSignUp() {
        let vc = SignUpViewControllerFactory.makeInstance()
        viewController?.present(vc, animated: true)
    }
}

private extension LoginRoutingImpl {
    struct SignUpViewControllerFactory {
        static func makeInstance() -> UINavigationController {
            let dependency = AccountRepositoryImpl()
            let viewModel = SignUpViewModel(dependency: dependency)
            let vc = SignUpViewController(viewModel: viewModel)
            return UINavigationController(rootViewController: vc)
        }
    }
}

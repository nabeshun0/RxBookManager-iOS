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
        let vc = SignUpViewControllerFactory.createInstance()
        viewController?.present(vc, animated: true)
    }
}

struct SignUpViewControllerFactory {
    static func createInstance() -> UINavigationController {
        let dependency = AccountRepositoryImpl.shared
        let viewModel = SignUpViewModel(dependency: dependency)
        let vc = SignUpViewController(viewModel: viewModel)
        return UINavigationController(rootViewController: vc)
    }
}

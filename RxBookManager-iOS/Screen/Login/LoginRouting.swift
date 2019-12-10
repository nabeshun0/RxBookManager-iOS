import UIKit
import DataManager

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
        let vc = Factory.makeSignUpViewController()
        viewController?.present(vc, animated: true)
    }
}

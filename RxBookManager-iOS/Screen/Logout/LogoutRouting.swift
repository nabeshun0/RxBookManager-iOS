import UIKit
import DataManager

protocol LogoutRouting: RoutingType {
    func showLogin()
}

final class LogoutRoutingImpl: LogoutRouting {

    weak var viewController: UIViewController?

    func showLogin() {
        let vc = Factory.makeLoginViewController()
        viewController?.present(vc, animated: true)
    }
}

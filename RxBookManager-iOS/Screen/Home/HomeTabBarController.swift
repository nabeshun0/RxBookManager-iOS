
import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let HomeBar = Factory.makeHomeViewController()
        let SignOutBar = Factory.makeSignOutViewController()
        setViewControllers([HomeBar, SignOutBar], animated: false)
    }
}

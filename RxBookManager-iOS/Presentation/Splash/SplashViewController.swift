import UIKit
import Lottie

final class SplashViewController: UIViewController {

    private lazy var routing: SplashRouting = {
        let routing = SplashRoutingImpl()
        routing.viewController = self
        return routing
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - 起動処理
        // Splashのアニメーション

        title = "Splash"
        view.backgroundColor = .white

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.routing.showLogin()
    }
}

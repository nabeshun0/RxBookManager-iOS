import UIKit
import Lottie

final class SplashViewController: UIViewController {

    struct Const {
        static let foxAnimation = "9477-fox"
    }

    private lazy var routing: SplashRouting = {
        let routing = SplashRoutingImpl()
        routing.viewController = self
        return routing
    }()

    private var animationView: AnimationView = {
        let animationView = AnimationView()
        let animation = Animation.named(Const.foxAnimation)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFill
        animationView.backgroundColor = .clear
        animationView.animationSpeed = 1
        return animationView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - 起動処理
        // Splashのアニメーション
        title = "Splash"
        view.backgroundColor = .lightGray
        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        animationView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        animationView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        animationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    func showAnimation() {
        animationView.play { [weak self] _ in
            self?.animationView.removeFromSuperview()
            self?.routing.showLogin()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
}

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class SignOutViewController: UIViewController {

    private let SignOutButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("ログアウト", for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var routing: SignOutRouting = {
        let routing = SignOutRoutingImpl()
        routing.viewController = self
        return routing
    }()

    private var viewModel: SignOutViewModel

    private let disposeBag: DisposeBag = .init()

    init(viewModel: SignOutViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "設定"

        setupLayout()
        bindUI()
    }

    private func setupLayout() {
        view.addSubview(SignOutButton)
        view.backgroundColor = .white

        // TODO: - のちほどレイアウト用ライブラリ、もしくはExtension導入
        SignOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        SignOutButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        SignOutButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        SignOutButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    private func bindUI() {

        let input = SignOutViewModel.Input(didButtonTapped: SignOutButton.rx.tap.asObservable())

        let output = viewModel.transform(input: input)

        output.result
            .subscribe(onNext: { [weak self] _ in
                self?.routing.showSignIn()
            }).disposed(by: disposeBag)


        output.error
            .subscribe(onNext: { [weak self] error in
                self?.createAlert(message: error.localizedDescription)
            }).disposed(by: disposeBag)
    }
}

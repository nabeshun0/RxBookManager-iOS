import UIKit
import APIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {

    private var viewModel: LoginViewModel

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //==================================================
    // MARK: - Presentation
    //==================================================

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "メールアドレス"
        return label
    }()

    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "パスワード"
        return label
    }()

    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "テキスト入力"
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.delegate = self
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "テキスト入力"
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.delegate = self
        return textField
    }()

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ログイン", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        return button
    }()

    private let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("新規作成", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(showSignUp), for: .touchUpInside)
        return button
    }()

    @objc func showSignUp() {
        routing.showSignUp()
    }

    //==================================================
    // MARK: - Routing
    //==================================================

    private lazy var routing: LoginRouting = {
        let routing = LoginRoutingImpl()
        routing.viewController = self
        return routing
    }()

    //==================================================
    // MARK: - Rx
    //==================================================

    private let disposeBag: DisposeBag = .init()

    //==================================================
    // MARK: - UIViewController override
    //==================================================

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "ログイン"
        loginButton.isHidden = true
        setupUI()
        bindUI()
    }
}

extension LoginViewController {
    func setupUI() {
        [emailLabel, emailTextField, passwordLabel, passwordTextField, loginButton, signupButton]
            .forEach {
                self.view.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }

        [emailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
         emailLabel.leftAnchor.constraint(equalTo: emailTextField.leftAnchor),
         emailLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -8),

         emailTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
         emailTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
         emailTextField.heightAnchor.constraint(equalToConstant: 40),

         passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
         passwordLabel.leftAnchor.constraint(equalTo: emailTextField.leftAnchor),

         passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
         passwordTextField.leftAnchor.constraint(equalTo: emailTextField.leftAnchor),
         passwordTextField.rightAnchor.constraint(equalTo: emailTextField.rightAnchor),
         passwordTextField.heightAnchor.constraint(equalToConstant: 40),

         loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
         loginButton.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor),
         loginButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor),
         loginButton.heightAnchor.constraint(equalToConstant: 50),

         signupButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
         signupButton.rightAnchor.constraint(equalTo: loginButton.rightAnchor),
         signupButton.heightAnchor.constraint(equalToConstant: 50),
         signupButton.widthAnchor.constraint(equalToConstant: 120)]
            .forEach {
                $0.isActive = true
        }
    }

    private func bindUI() {
        let input = LoginViewModel.Input(didLoginButtonTapped: loginButton.rx.tap.asObservable(), didSignupButtonTapped: signupButton.rx.tap.asObservable(), emailText: emailTextField.rx.text.orEmpty.asObservable(), passwordText: passwordTextField.rx.text.orEmpty.asObservable())
        let output = viewModel.transform(input: input)
        output.isValid.subscribe { [weak self] (bool) in
            // ログインボタンを表示
            self?.loginButton.isHidden = false
        }.disposed(by: disposeBag)

        output.result.subscribe(onNext: { [weak self] _ in
            self?.routing.showMainTab()
        }).disposed(by: disposeBag)

        output.error.subscribe(onNext: { [weak self] error in
            self?.createAlert(message: error.localizedDescription)
        }).disposed(by: disposeBag)
    }
}

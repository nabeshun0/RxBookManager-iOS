//
//  LogoutViewController.swift
//  RxBookManager-iOS
//
//  Created by member on 2019/06/29.
//  Copyright © 2019 nabezawa. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class LogoutViewController: UIViewController {

    private let logoutButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("ログアウト", for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var routing: LogoutRouting = {
        let routing = LogoutRoutingImpl()
        routing.viewController = self
        return routing
    }()

    private var viewModel: LogoutViewModel

    private let disposeBag: DisposeBag = .init()

    init(viewModel: LogoutViewModel) {
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
        view.addSubview(logoutButton)
        view.backgroundColor = .white

        // TODO: - のちほどレイアウト用ライブラリ、もしくはExtension導入
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        logoutButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    private func bindUI() {

        let input = LogoutViewModel.Input(didButtonTapped: logoutButton.rx.tap.asObservable())

        let output = viewModel.transform(input: input)

        output.result
            .subscribe(onNext: { _ in
                // MARK: - 遷移処理
            }).disposed(by: disposeBag)


        output.error
            .subscribe(onNext: { [weak self] error in
                self?.createAlert(message: error.localizedDescription)
            }).disposed(by: disposeBag)
    }
}

//
//  SplashViewController.swift
//  RxBookManager-iOS
//
//  Created by Iichiro Kawashima on 2019/08/29.
//  Copyright © 2019 nabezawa. All rights reserved.
//

import UIKit

final class SplashViewController: UIViewController {

    private let routing = SplashRoutingImpl()

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - 起動処理
        // Splashのアニメーション

        routing.viewController = self
        title = "Splash"
        view.backgroundColor = .white

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.routing.showLogin()
    }
}

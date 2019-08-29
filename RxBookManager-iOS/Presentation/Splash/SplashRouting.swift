//
//  SplashRouting.swift
//  RxBookManager-iOS
//
//  Created by Iichiro Kawashima on 2019/08/29.
//  Copyright © 2019 nabezawa. All rights reserved.
//
import UIKit

protocol SplashRouting: RoutingType {
    func showLogin()
}

final class SplashRoutingImpl: SplashRouting {

    weak var viewController: UIViewController?

    func showLogin() {
        let dependency = AccountRepositoryImpl.shared
        let viewModel = LoginViewModel(dependency: dependency)
        let vc = LoginViewController(viewModel: viewModel)
        let nc = UINavigationController(rootViewController: vc)
        viewController?.present(nc, animated: false)
    }
}

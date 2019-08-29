//
//  MainTabBarController.swift
//  RxBookManager-iOS
//
//  Created by member on 2019/06/29.
//  Copyright © 2019 nabezawa. All rights reserved.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let bookListView = BookListViewController()
        bookListView.tabBarItem = UITabBarItem(title: "一覧", image: nil, tag: 1)
        let bookListBar = UINavigationController(rootViewController: bookListView)

        let logoutBar = LogoutViewControllerFactory.createInstance()
        setViewControllers([bookListBar, logoutBar], animated: false)
    }
}

struct LogoutViewControllerFactory {
    static func createInstance() -> UINavigationController {
        let dependency = AccountRepositoryImpl.shared
        let viewModel = LogoutViewModel(dependency: dependency)
        let vc = LogoutViewController(viewModel: viewModel)
        vc.tabBarItem = UITabBarItem(title: "設定", image: nil, tag: 2)
        let logoutBar = UINavigationController(rootViewController: vc)
        return logoutBar
    }
}

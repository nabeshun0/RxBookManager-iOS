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
        let bookListBar = BookListViewControllerFactory.createInstance()
        let logoutBar = LogoutViewControllerFactory.makeInstance()
        setViewControllers([bookListBar, logoutBar], animated: false)
    }
}

struct BookListViewControllerFactory {
    static func createInstance() -> UINavigationController {
        let dependency = BookRepositoryImpl()
        let viewModel = BookListViewModel(dependency: dependency)
        let vc = BookListViewController(viewModel: viewModel)
        vc.tabBarItem = UITabBarItem(title: "一覧", image: #imageLiteral(resourceName: "bookIconTab"), tag: 1)
        let bookListBar = UINavigationController(rootViewController: vc)
        return bookListBar
    }
}

struct LogoutViewControllerFactory {
    static func makeInstance() -> UINavigationController {
        let dependency = AccountRepositoryImpl()
        let viewModel = LogoutViewModel(dependency: dependency)
        let vc = LogoutViewController(viewModel: viewModel)
        vc.tabBarItem = UITabBarItem(title: "設定", image: #imageLiteral(resourceName: "settingIconTab"), tag: 2)
        let logoutBar = UINavigationController(rootViewController: vc)
        return logoutBar
    }
}

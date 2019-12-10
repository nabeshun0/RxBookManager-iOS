//
//  MainTabBarController.swift
//  RxBookManager-iOS
//
//  Created by member on 2019/06/29.
//  Copyright © 2019 nabezawa. All rights reserved.
//

import UIKit
import DataManager

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bookListBar = Factory.makeBookListViewController()
        let logoutBar = Factory.makeLogoutViewController()
        setViewControllers([bookListBar, logoutBar], animated: false)
    }
}

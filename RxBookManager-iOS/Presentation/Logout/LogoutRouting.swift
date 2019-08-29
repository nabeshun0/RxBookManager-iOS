//
//  LogoutRouting.swift
//  RxBookManager-iOS
//
//  Created by member on 2019/06/29.
//  Copyright © 2019 nabezawa. All rights reserved.
//

import UIKit
import Foundation

protocol LogoutRouting: RoutingType {
    func showLogin()
}

final class LogoutRoutingImpl: LogoutRouting {

    weak var viewController: UIViewController?

    func showLogin() {

    }
}

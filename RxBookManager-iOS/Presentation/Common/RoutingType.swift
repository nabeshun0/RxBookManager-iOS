//
//  RoutingType.swift
//  RxBookManager-iOS
//
//  Created by Iichiro Kawashima on 2019/08/29.
//  Copyright © 2019 nabezawa. All rights reserved.
//

import Foundation
import UIKit

protocol RoutingType {
    var viewController: UIViewController? { get set }
    static func makeInstance() -> UINavigationController
}

extension RoutingType {
    static func makeInstance() -> UINavigationController {
        return UINavigationController()
    }
}

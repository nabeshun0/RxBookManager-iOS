//
//  UIAlertController+Extensions.swift
//  RxBookManager-iOS
//
//  Created by Iichiro Kawashima on 2019/08/29.
//  Copyright © 2019 nabezawa. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

enum AlertAction: CustomStringConvertible {
    case okay
    case cancel

    var description: String {
        switch self {
        case .okay:
            return "OK"
        case .cancel:
            return "Cancel"
        }
    }
}

extension UIAlertController {
    static func showDialog<AlertAction: CustomStringConvertible>(from viewController: UIViewController,
                                                                 title: String,
                                                                 message: String,
                                                                 cancelAction: AlertAction,
                                                                 actions: [AlertAction] = []) -> Observable<AlertAction> {
        return Observable.create { observer in
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: cancelAction.description, style: .cancel) { _ in
                observer.on(.next(cancelAction))
            })

            actions.forEach({ action in
                alert.addAction(UIAlertAction(title: action.description, style: .default) { _ in
                    observer.on(.next(action))
                })
            })

            viewController.present(alert, animated: true)

            return Disposables.create {
                alert.dismiss(animated: false)
            }
        }
    }
}

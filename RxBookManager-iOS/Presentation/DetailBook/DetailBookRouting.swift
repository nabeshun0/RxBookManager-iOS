import UIKit

protocol DetailBookRouting: RoutingType {
    func showBookListVC()
}

final class DetaiBookRoutingImpl: DetailBookRouting {
    var viewController: UIViewController?

    func showBookListVC() {
        guard let view = viewController?.navigationController else { return }
        view.popViewController(animated: true)
    }
}

import UIKit
import DataManager

struct Factory {
    static func makeLoginViewController() -> UINavigationController {
        let dependency = AccountRepositoryImpl()
        let viewModel = LoginViewModel(dependency: dependency)
        let vc = LoginViewController(viewModel: viewModel)
        return UINavigationController(rootViewController: vc)
    }

    static func makeSignUpViewController() -> UINavigationController {
        let dependency = AccountRepositoryImpl()
        let viewModel = SignUpViewModel(dependency: dependency)
        let vc = SignUpViewController(viewModel: viewModel)
        return UINavigationController(rootViewController: vc)
    }

    static func makeBookListViewController() -> UINavigationController {
        let dependency = BookRepositoryImpl()
        let viewModel = BookListViewModel(dependency: dependency)
        let vc = BookListViewController(viewModel: viewModel)
        vc.tabBarItem = UITabBarItem(title: "一覧", image: #imageLiteral(resourceName: "bookIconTab"), tag: 1)
        let bookListBar = UINavigationController(rootViewController: vc)
        return bookListBar
    }


    static func makeLogoutViewController() -> UINavigationController {
        let dependency = AccountRepositoryImpl()
        let viewModel = LogoutViewModel(dependency: dependency)
        let vc = LogoutViewController(viewModel: viewModel)
        vc.tabBarItem = UITabBarItem(title: "設定", image: #imageLiteral(resourceName: "settingIconTab"), tag: 2)
        let logoutBar = UINavigationController(rootViewController: vc)
        return logoutBar
    }

    static func makeRegisterBookViewController() -> UINavigationController {
        let dependency = BookRepositoryImpl()
        let viewModel = RegisterBookViewModel(dependency: dependency)
        let vc = RegisterBookViewController(viewModel: viewModel)
        return UINavigationController(rootViewController: vc)
    }


    static func makeDetailBookViewController(book: BookInfo) -> DetailBookViewController {
        let dependency = BookRepositoryImpl()
        let viewModel = DetailBookViewModel(dependency: dependency)
        return DetailBookViewController(viewModel: viewModel, book: book)
    }
}

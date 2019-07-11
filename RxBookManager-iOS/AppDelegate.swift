import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        // 初回起動時はSignUpVCを表示
//        if !AuthManager.isLoggedIn() {
//            let firstScreen = SignUpViewController()
//            window?.rootViewController = firstScreen
//        } else {
//            let firstScreen = LoginViewController()
//            window?.rootViewController = UINavigationController(rootViewController: firstScreen)
//        }
        let firstScreen = LoginViewController()
        window?.rootViewController = firstScreen
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) {}
    func applicationWillEnterForeground(_ application: UIApplication) {}
    func applicationDidBecomeActive(_ application: UIApplication) {}
    func applicationWillTerminate(_ application: UIApplication) {}
}


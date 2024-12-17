import UIKit
import FirebaseCore

enum WindowCase{
    case login, reg, home
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private let authService = AuthService()
    
    func scene( _ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        NotificationCenter.default.addObserver(self, selector: #selector(routeVc(notification: )), name: Notification.Name(rawValue: "routeVC"), object: nil)
        
        guard let scene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: scene)
        
        FirebaseApp.configure()
        
        if authService.isLogin() {
            self.window?.rootViewController = windowManage(vc: .home)
        } else {
            self.window?.rootViewController = windowManage(vc: .reg)
        }
    
        self.window?.makeKeyAndVisible()
    }
    
    
    
    private func windowManage(vc: WindowCase) -> UIViewController{
        switch vc {
        case .login:
            return LoginViewController()
        case .reg:
            return RegisterViewController()
        case .home:
            return UINavigationController(rootViewController: HomeViewController())
        }
        
        
        
    }
    @objc func routeVc(notification: Notification){
        guard let userInfo =  notification.userInfo, let vc = userInfo["vc"] as? WindowCase else {return}
        self.window?.rootViewController = windowManage(vc: vc)
    }
    
}

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }





//
//  ViewController.swift
//  PizzaHammer

import UIKit

class BarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let generalVC = GeneralViewController()
        let contactVC = ContactViewController()
        let cartVC = CartViewController()
        let profileVC = ProfileViewController()
        
        generalVC.tabBarItem = UITabBarItem(title: "Домой", image: UIImage(systemName: "house"), tag: 0)
        contactVC.tabBarItem = UITabBarItem(title: "Контакты", image: UIImage(systemName: "location.circle.fill"), tag: 1)
        cartVC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "cart"), tag: 2)
        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 3)
        
        let tabBarC = UITabBarController()
       
        tabBarC.viewControllers = [generalVC, contactVC, cartVC, profileVC]
        tabBarC.tabBar.tintColor = .systemPink
        tabBarC.tabBar.backgroundColor = .systemGray4
        tabBarC.tabBar.barStyle = .default
        tabBarC.tabBar.layer.borderWidth = 0.4
        tabBarC.tabBar.layer.borderColor = CGColor(gray: 4, alpha: 4)
        
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    if let window = windowScene.windows.first {
                        window.rootViewController = tabBarC
                        window.makeKeyAndVisible()
                    }
                }
    }


}


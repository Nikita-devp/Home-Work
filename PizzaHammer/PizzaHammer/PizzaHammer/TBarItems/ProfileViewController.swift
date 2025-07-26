//
//  ProfileViewController.swift
//  PizzaHammer


import UIKit

class ProfileViewController: UIViewController {
    
    lazy var delog = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(delog)
        
        view.backgroundColor = .blue
        
        delog.setTitle("выйти", for: .normal)
        delog.backgroundColor = .systemPink
        delog.addTarget(self, action: #selector(logout), for: .touchUpInside)
        delog.setTitleColor(.black, for: .highlighted)
        
        delog.translatesAutoresizingMaskIntoConstraints = false
        delog.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        delog.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    @objc func logout(){
        
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        let loginVC = AuthViewController()
        navigationController?.setViewControllers([loginVC], animated: true)
    }

}

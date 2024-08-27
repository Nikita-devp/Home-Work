//
//  ViewController.swift
//  HW8
//
//  Created by Никита Гойшик on 5.07.24.
//

import UIKit

class manualViewController: UIViewController {
    
   lazy var label: UILabel = UILabel()
    lazy var LoginButton : UIButton = UIButton()
    
    lazy var login: UITextField = UITextField()
  lazy var password: UITextField = UITextField()
    
    lazy var wrapper: UIView = UIView()
    
    
    
    
    override func viewDidLoad() {
        
        view.addSubview(label)
        view.addSubview(login)
        view.addSubview(LoginButton)
        view.addSubview(password)
        
        super.viewDidLoad()
    
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 150).isActive = true
        label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        
        label.text = "Document holder"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .center
        label.backgroundColor = .blue
        label.textColor = .white
        
        
        LoginButton.titleLabel?.font = .systemFont(ofSize: 30)
        LoginButton.backgroundColor = .blue
        LoginButton.setTitle("Log in", for: .normal)
        LoginButton.setTitleColor(.black, for: .highlighted)
        LoginButton.isEnabled = false
    
        LoginButton.translatesAutoresizingMaskIntoConstraints = false
        LoginButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 250) .isActive = true
        LoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0) .isActive = true
        
        
        // поля входа
        
        login.placeholder = "login"
        password.placeholder = "password"
        password.isSecureTextEntry = true
        password.keyboardType = .default
      
        
        login.translatesAutoresizingMaskIntoConstraints = false
        login.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30) .isActive = true
        login.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0) .isActive = true
        
        password.translatesAutoresizingMaskIntoConstraints = false
        password.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 30).isActive = true
        password.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        view.backgroundColor = .white
    }
    
}



//
//  ViewController.swift
//  MyGraduationProject
//
//  Created by Hoishik Nikita on 21.11.24.
//

import Foundation
import UIKit

enum AuthViewDelegateLoginError: Error {
    case emptyLogin
    case emptyPassword
    case emptyLoginAndPassword
    case wrongLoginOrPassword
    
    var errorMessage: String {
        return switch self {
        case .emptyLogin: "Empty login"
        case .emptyLoginAndPassword: "Empty login and password"
        case .emptyPassword: "Empty password"
        case .wrongLoginOrPassword: "Wrong login or password"
        }
    }
}
enum AuthViewDelegateRegisterError: Error {
    case emptyLogin
    case emptyPassword
    case emptyLoginAndPassword
    case save
    
    var errorMessage: String {
        return switch self {
        case .emptyLogin: "Empty login"
        case .emptyLoginAndPassword: "Empty login and password"
        case .emptyPassword: "Empty password"
        case .save: "Something wrong with storage"
        }
    }
}

protocol AuthViewDelegate: AnyObject {
    func login(login: String?, password: String?) -> Result<Void, AuthViewDelegateLoginError>
    func register(login: String?, password: String?, user: User) -> Result<Void, AuthViewDelegateRegisterError>
    func presentRegisterView()
}


class LoginViewController: UIViewController {
    
    weak var delegate: AuthViewDelegate?
        
    lazy var fieldsStackView: UIStackView = .init()
    
    lazy var nameLabel = UILabel()
    lazy var imageFirstView = UIImageView()
    lazy var firstStackLoginButton = UIStackView()
    lazy var loginButton = UITextField()
    lazy var passwordButton = UITextField()
    lazy var acceptButton = UIButton()
    lazy var registerButton = UIButton()
    lazy var image = UIImageView(image: UIImage(systemName: "pencil"))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.hideNavigationBar()
        view.addSubview(nameLabel)
        view.addSubview(image)
        view.addSubview(firstStackLoginButton)
        view.addSubview(registerButton)
        
        
        // label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "DocBOX"
        nameLabel.font = .systemFont(ofSize: 30, weight: .medium)
        nameLabel.textColor = .black
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // image
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        image.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250).isActive = true
        image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45).isActive = true
        image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45).isActive = true
        
        
        // register
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.systemBlue, for: .normal)
        registerButton.setTitleColor(.blue, for: .highlighted)
        registerButton.backgroundColor = .systemGray6
        registerButton.layer.cornerRadius = 10
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.bottomAnchor.constraint(equalTo: firstStackLoginButton.topAnchor, constant: -10).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        
        // stack button
        firstStackLoginButton.backgroundColor = .systemGray6
        firstStackLoginButton.layer.opacity = 0.9
        firstStackLoginButton.layer.cornerRadius = 35
        firstStackLoginButton.addArrangedSubview(loginButton)
        firstStackLoginButton.addArrangedSubview(passwordButton)
        firstStackLoginButton.addArrangedSubview(acceptButton)
        
        firstStackLoginButton.axis = .vertical
        firstStackLoginButton.layoutMargins
        firstStackLoginButton.isLayoutMarginsRelativeArrangement = true
        firstStackLoginButton.spacing = 15
        firstStackLoginButton.distribution = .fillEqually
        firstStackLoginButton.alignment = .center
        
        firstStackLoginButton.translatesAutoresizingMaskIntoConstraints = false
        firstStackLoginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        firstStackLoginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        firstStackLoginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
        
        // seting button
        loginButton.placeholder = "Enter your login"
        loginButton.keyboardType = .default
        loginButton.textAlignment = .center
        loginButton.keyboardType = .emailAddress
        loginButton.backgroundColor = .systemGray5
        loginButton.layer.cornerRadius = 15
        loginButton.textColor = .gray
        loginButton.topAnchor.constraint(equalTo: firstStackLoginButton.topAnchor, constant: 15).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: firstStackLoginButton.leadingAnchor, constant: 25).isActive = true
        
        passwordButton.placeholder = "Enter your password"
        passwordButton.keyboardType = .default
        passwordButton.isSecureTextEntry = true
        passwordButton.textAlignment = .center
        passwordButton.keyboardType = .numberPad
        passwordButton.backgroundColor = .systemGray5
        passwordButton.layer.cornerRadius = 15
        passwordButton.textColor = .gray
        passwordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10).isActive = true
        passwordButton.leadingAnchor.constraint(equalTo: firstStackLoginButton.leadingAnchor, constant: 25).isActive = true
        
        acceptButton.setTitle("Sign in", for: .normal)
        acceptButton.setTitleColor(.white, for: .normal)
        acceptButton.setTitleColor(.systemGray3, for: .highlighted)
        acceptButton.backgroundColor = .systemBlue
        acceptButton.layer.cornerRadius = 15
        acceptButton.titleLabel?.textAlignment = .center
        acceptButton.bottomAnchor.constraint(equalTo: firstStackLoginButton.bottomAnchor, constant: -15).isActive = true
        acceptButton.leadingAnchor.constraint(equalTo: firstStackLoginButton.leadingAnchor, constant: 60).isActive = true
        acceptButton.addTarget(self, action: #selector(vctoshow), for: .touchUpInside)
}
    
    lazy var erorLabel: UILabel = .init()
    
    init() {
        super.init(frame: .zero)
        print("view load")
    }
    
    
    @objc func vctoshow(){
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
    func removeToViewController(){
        self.navigationController?.setViewControllers([LoginViewController()], animated: true)
    }
}



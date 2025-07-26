//
//  LoginViewController.swift
//  PizzaHammer

import UIKit


class AuthViewController: UIViewController {
    
    lazy var wrapper: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemPink
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFit
        image.frame = .init(x: 17, y: 520, width: 360, height: 230)
        return image
    }()
    
    lazy var generalLabel = UILabel()
    
    lazy var loginLabel = UILabel()
    lazy var loginField = UITextField()
    lazy var passwordLabel = UILabel()
    lazy var passwordField = UITextField()
    
    lazy var acceptButton = UIButton()
    lazy var registerButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        
        view.addSubview(wrapper)
        view.addSubview(generalLabel)
        view.addSubview(loginLabel)
        view.addSubview(loginField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordField)
        view.addSubview(acceptButton)
        view.addSubview(registerButton)
        
        
        generalLabel.text = "Авторизация"
        generalLabel.font = .systemFont(ofSize: 60)
        generalLabel.font = .boldSystemFont(ofSize: 35)
        
        generalLabel.translatesAutoresizingMaskIntoConstraints = false
        generalLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35).isActive = true
        generalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        // Логин сетап
        loginLabel.text = "Логин"
        loginLabel.font = .systemFont(ofSize: 25)
        loginLabel.font = .boldSystemFont(ofSize: 18)
        
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.topAnchor.constraint(equalTo: wrapper.topAnchor, constant: 15).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor, constant: 15).isActive = true
        
        loginField.backgroundColor = .systemGray6
        loginField.layer.cornerRadius = 10
        loginField.keyboardType = .default
        
        loginField.translatesAutoresizingMaskIntoConstraints = false
        loginField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 15).isActive = true
        loginField.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor, constant: 13).isActive = true
        loginField.trailingAnchor.constraint(equalTo: wrapper.trailingAnchor, constant: -13).isActive = true
        loginField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        // Пароль сетап
        passwordLabel.text = "Пароль"
        passwordLabel.font = .systemFont(ofSize: 25)
        passwordLabel.font = .boldSystemFont(ofSize: 18)
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 15).isActive = true
        passwordLabel.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor, constant: 15).isActive = true
        
        passwordField.backgroundColor = .systemGray6
        passwordField.layer.cornerRadius = 10
        passwordField.keyboardType = .default
        passwordField.isSecureTextEntry = true
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 15).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor, constant: 13).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: wrapper.trailingAnchor, constant: -13).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        // Кнопка дальше
        acceptButton.setImage(UIImage(systemName: "arrowshape.right.fill"), for: .normal)
        acceptButton.tintColor = .black
        acceptButton.backgroundColor = .systemPink
        acceptButton.layer.cornerRadius = 20
        
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.topAnchor.constraint(equalTo: wrapper.bottomAnchor, constant: 20).isActive = true
        acceptButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35).isActive = true
        acceptButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        acceptButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        acceptButton.addTarget(self, action: #selector(goToGeneral), for: .touchUpInside)
        
        
        // кнопка польз. согл.
        registerButton.setTitle("Регистация", for: .normal)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.setTitleColor(.systemPink, for: .highlighted)
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.topAnchor.constraint(equalTo: wrapper.bottomAnchor, constant: 20).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        registerButton.addTarget(self, action: #selector(goToReg), for: .touchUpInside)
        
    }
    
    @objc func goToReg(){
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    @objc func goToGeneral(){
        
        guard let login = loginField.text,
              let password = passwordField.text else { return }
        
        let saveLogin = UserDefaults.standard.string(forKey: "login")
        let savePassword = UserDefaults.standard.string(forKey: "password")
        
        if login == saveLogin && password == savePassword {
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            
            let homeVC = GeneralViewController()
            navigationController?.pushViewController(homeVC, animated: true)
        } else {
            print("Неверно введен логин или пароль")
        }
    }
    
}

import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import UIKit

 class LoginViewController: UIViewController {
        
    private let service = AuthService()
     
    lazy var nameLabel = UILabel()
    lazy var firstStackLoginButton = UIStackView()
    lazy var loginButton = UITextField()
    lazy var passwordButton = UITextField()
    lazy var acceptButton = UIButton()
    lazy var image = UIImageView(image: UIImage(systemName: "pencil"))
     
     
    lazy var registerButton: UIButton = {
        $0.setImage(UIImage(systemName: "person.fill.badge.plus"), for: .normal)
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 5
        return $0
    }(UIButton(primaryAction: UIAction(handler: {[weak self] _ in
        guard let self = self else {return}
        NotificationCenter.default.post(name: Notification.Name(rawValue: "routeVC"), object: nil, userInfo: ["vc": WindowCase.reg]) })))
    
     
     lazy var loginAction: UIAction = UIAction {[weak self] _ in
         guard let self = self else {return}
         let email = loginButton.text ?? ""
         let password = passwordButton.text ?? ""
         
         let user = UserData(email: email, password: password)
         service.signIn(user: user) { result in
             switch result {
             case .success(let success):
                 NotificationCenter.default.post(name: Notification.Name(rawValue: "routeVC"), object: nil, userInfo: ["vc": WindowCase.home])
             case .failure(let failure):
                 print(failure)
       }
    }
}

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(image)
        view.addSubview(firstStackLoginButton)
        view.addSubview(registerButton)
        
        
        // label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "ImageBOX"
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
        /// login
        loginButton.placeholder = "Enter your login"
        loginButton.keyboardType = .default
        loginButton.textAlignment = .center
        loginButton.keyboardType = .emailAddress
        loginButton.backgroundColor = .systemGray5
        loginButton.layer.cornerRadius = 15
        loginButton.textColor = .gray
        loginButton.topAnchor.constraint(equalTo: firstStackLoginButton.topAnchor, constant: 15).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: firstStackLoginButton.leadingAnchor, constant: 25).isActive = true
        
        /// password
        passwordButton.placeholder = "Enter your password"
        passwordButton.isSecureTextEntry = true
        passwordButton.textAlignment = .center
        passwordButton.keyboardType = .numberPad
        passwordButton.backgroundColor = .systemGray5
        passwordButton.layer.cornerRadius = 15
        passwordButton.textColor = .gray
        passwordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10).isActive = true
        passwordButton.leadingAnchor.constraint(equalTo: firstStackLoginButton.leadingAnchor, constant: 25).isActive = true
        
        /// password
        acceptButton.setTitle("Sign in", for: .normal)
        acceptButton.setTitleColor(.white, for: .normal)
        acceptButton.setTitleColor(.systemGray3, for: .highlighted)
        acceptButton.backgroundColor = .systemBlue
        acceptButton.layer.cornerRadius = 15
        acceptButton.titleLabel?.textAlignment = .center
        acceptButton.bottomAnchor.constraint(equalTo: firstStackLoginButton.bottomAnchor, constant: -15).isActive = true
        acceptButton.leadingAnchor.constraint(equalTo: firstStackLoginButton.leadingAnchor, constant: 60).isActive = true
        acceptButton.addAction(loginAction, for: .touchUpInside)
}
   
     
    @objc func vctoshow(){
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
    func removeToViewController(){
        self.navigationController?.setViewControllers([LoginViewController()], animated: true)
    }
    
}



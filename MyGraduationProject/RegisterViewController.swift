import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    
    let service = AuthService()
    
    lazy var label = UILabel()
    lazy var acc = UIButton()
    lazy var stack = UIStackView()
    lazy var loginButton = UITextField()
    lazy var passwordButton = UITextField()
    lazy var image = UIImageView(image: UIImage(systemName: "person.badge.plus"))
    lazy var acceptButton = UIButton()
    let vc = LoginViewController()
    
    lazy var accept: UIAction = UIAction { [weak self] _ in
        guard let self = self else {return}
        
        let loginBut = loginButton.text
        let passwordBut = passwordButton.text
        
        let user = UserData(email: loginBut ?? "", password: passwordBut ?? "")
        service.createNewUser(user: user, complition: { result in
            switch result {
            case .success(let success):
                NotificationCenter.default.post(name: Notification.Name(rawValue: "routeVC"), object: nil, userInfo: ["vc": WindowCase.login])
            case .failure(let failure):
                print(failure)
            }
            
        })
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stack)
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(acc)
        view.backgroundColor = .white
        
        
        // label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Registration"
        label.font = .systemFont(ofSize: 30, weight: .medium)
        label.textColor = .black
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        // image
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: view.topAnchor, constant: 270).isActive = true
        image.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -310).isActive = true
        image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
    
        
        // stack
        stack.backgroundColor = .systemGray6
        stack.layer.opacity = 0.9
        stack.layer.cornerRadius = 35
        stack.axis = .vertical
        stack.layoutMargins
        stack.isLayoutMarginsRelativeArrangement = true
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.addArrangedSubview(loginButton)
        stack.addArrangedSubview(passwordButton)
        stack.addArrangedSubview(acceptButton)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 100).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
        
        loginButton.placeholder = "Youre login"
        loginButton.keyboardType = .default
        loginButton.textAlignment = .center
        loginButton.keyboardType = .emailAddress
        loginButton.backgroundColor = .systemGray5
        loginButton.layer.cornerRadius = 15
        loginButton.textColor = .gray
        loginButton.topAnchor.constraint(equalTo: stack.topAnchor, constant: 15).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 10).isActive = true
        
        
        passwordButton.placeholder = "Youre password"
        passwordButton.keyboardType = .default
        passwordButton.textAlignment = .center
        passwordButton.keyboardType = .numberPad
        passwordButton.backgroundColor = .systemGray5
        passwordButton.layer.cornerRadius = 15
        passwordButton.textColor = .gray
        passwordButton.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 10).isActive = true
        
        
        acceptButton.setTitle("Go", for: .normal)
        acceptButton.setTitleColor(.white, for: .normal)
        acceptButton.setTitleColor(.systemGray3, for: .highlighted)
        acceptButton.backgroundColor = .systemBlue
        acceptButton.layer.cornerRadius = 15
        acceptButton.titleLabel?.textAlignment = .center
        acceptButton.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 50).isActive = true
        acceptButton.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: 15).isActive = true
        acceptButton.addAction(accept, for: .touchUpInside)
        
        //acc
        acc.translatesAutoresizingMaskIntoConstraints = false
        acc.setTitle("my acc", for: .normal)
        acc.setTitleColor(.green, for: .normal)
        acc.setTitleColor(.red, for: .highlighted)
        acc.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        acc.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        acc.addAction(UIAction(handler: {_ in
            self.navigationController?.pushViewController(self.vc, animated: true)
        }), for: .touchUpInside)
        
        
    }
    
    @objc func goToReg(){
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    @objc func goToMyAcc(){
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
}

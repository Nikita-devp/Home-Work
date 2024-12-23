import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    let service = AuthService()
    
    lazy var label = UILabel()
    lazy var stack = UIStackView()
    lazy var loginButton = UITextField()
    lazy var passwordButton = UITextField()
    lazy var image = UIImageView(image: UIImage(systemName: "person.badge.plus"))
    lazy var acceptButton = UIButton()
    let vc = LoginViewController()
    
    
    lazy var accLogin: UIButton = {
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 10
        return $0
    }(UIButton(primaryAction: UIAction(handler: {[weak self] _ in
        guard let self = self else {return}
        NotificationCenter.default.post(name: Notification.Name(rawValue: "routeVC"), object: nil, userInfo: ["vc": WindowCase.login]) })))
    
    
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
        view.addSubview(accLogin)
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
    
        
        // stack button
        stack.backgroundColor = .systemGray6
        stack.layer.opacity = 0.9
        stack.layer.cornerRadius = 35
        stack.axis = .vertical
        stack.layoutMargins
        stack.isLayoutMarginsRelativeArrangement = true
        stack.spacing = 15
        stack.distribution = .fillEqually
        stack.alignment = .center
        
        stack.addArrangedSubview(loginButton)
        stack.addArrangedSubview(passwordButton)
        stack.addArrangedSubview(acceptButton)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 125).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
        
        /// login field
        loginButton.placeholder = "Youre login"
        loginButton.keyboardType = .default
        loginButton.textAlignment = .center
        loginButton.keyboardType = .emailAddress
        loginButton.backgroundColor = .systemGray5
        loginButton.layer.cornerRadius = 15
        loginButton.textColor = .gray
        loginButton.topAnchor.constraint(equalTo: stack.topAnchor, constant: 15).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25).isActive = true
        
        
        /// password field
        passwordButton.placeholder = "Youre password"
        passwordButton.keyboardType = .default
        passwordButton.textAlignment = .center
        passwordButton.keyboardType = .numberPad
        passwordButton.backgroundColor = .systemGray5
        passwordButton.layer.cornerRadius = 15
        passwordButton.textColor = .gray
        passwordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10).isActive = true
        passwordButton.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 25).isActive = true
        
        
        /// accept button
        acceptButton.setTitle("Go", for: .normal)
        acceptButton.setTitleColor(.white, for: .normal)
        acceptButton.setTitleColor(.systemGray3, for: .highlighted)
        acceptButton.backgroundColor = .systemBlue
        acceptButton.layer.cornerRadius = 15
        acceptButton.titleLabel?.textAlignment = .center
        acceptButton.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 60).isActive = true
        acceptButton.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -15).isActive = true
        acceptButton.addAction(accept, for: .touchUpInside)
        
        // go to accLogin
        accLogin.translatesAutoresizingMaskIntoConstraints = false
        accLogin.setImage(UIImage(systemName: "arrowshape.left"), for: .normal)
        accLogin.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        accLogin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        accLogin.addAction(UIAction(handler: {_ in
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
